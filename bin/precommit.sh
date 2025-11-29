#!/bin/bash

# Function to execute a command and handle its output
run_command() {
    local cmd=$1
    local log_file=$2
    local description=$3

    echo "Running: $description..."
    if eval "$cmd" > "$log_file" 2>&1; then
        echo "Success: $description. Log file is at $log_file"
    else
        echo "Error: $description failed. Dumping log file:"
        cat "$log_file"
        exit 1
    fi
}

# --- Build Runner ---
run_command "dart run build_runner build" "precommit_build_runner.log" "Build Runner"

# --- Format and Fix Files ---
format_and_fix_files() {(
    set -e

    dart format lib test
    dart fix --apply
)}
run_command "format_and_fix_files" "precommit_format.log" "Formatting and fixing files"

# --- Run Tests ---
run_command "dart test --reporter failures-only --coverage-path=coverage/lcov.info -x postgen" "precommit_test.log" "Running Tests"

# --- Run Sample Tests ---
run_command "dart run test/sample_test_runner.dart --coverage-path=sample_coverage/lcov.info" "precommit_sample_test.log" "Running Sample Tests"

# --- Analyze Coverage ---
analyze_coverage() {
    git show HEAD:COVERAGE.csv > OLD_COVERAGE.csv && \
    perl -ne '
      BEGIN {
        print "filepath,lines_of_code,lines_of_code_hit,coverage_percent,untested_code_lines\n";
      }
      if (/^(SF):.*(lib\/.*)/) { $h{$1} = $2; }
      elsif (/^(LF|LH):(.*)/) { $h{$1} = $2; }
      elsif (/^DA:(\d+),0/) { push @z, $1; }
      elsif (/^end_of_record/) {
        my $p = $h{LF} ? ($h{LH} / $h{LF}) * 100 : 0;
        my $z_lines = join(";", @z);
        printf "%s,%d,%d,%.2f,%s\n", $h{SF}, $h{LF}, $h{LH}, $p, $z_lines;
        %h = ();
        @z = ();
      }
    ' coverage/lcov.info sample_coverage/lcov.info | sort -k4,4 -n -t, > COVERAGE.csv && \
    dart run bin/analyze_coverage.dart && \
    rm OLD_COVERAGE.csv
}
run_command "analyze_coverage" "precommit_coverage.log" "Coverage analysis"
