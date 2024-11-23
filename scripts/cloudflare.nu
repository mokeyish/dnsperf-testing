#!/usr/bin/env nu

# Generate domain list for dnsperf testing.
#
# Please download the csv file from https://radar.cloudflare.com/domains
def main [
    csv_file: path
    --type (-t): string = "A"
    --count (-c): int = 100000
    --output (-o) : string
] {
    let output = if $output != null {
        $output
    } else {
        $"domain-($count).txt"
    }
    open $csv_file | take $count | par-each { |x| $"($x.domain) ($type)" } | save -f $"($output)"
    print $"Saved to ($output)"
}