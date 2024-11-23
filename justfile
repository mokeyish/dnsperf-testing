
set dotenv-load
set quiet

[private]
alias t := test

[private]
alias g := generate

[private]
default:
  just --list

# Generate domain list for dnsperf testing.
generate:
    ./scripts/cloudflare.nu $INPUT_CSV -c $COUNT -o $DOMAIN_FILE

# Run dnsperf test.
test:
    [ -f $DOMAIN_FILE ] || just generate
    dnsperf -d $DOMAIN_FILE -s $SERVER -p $PORT -c $CLIENT_COUNT -t $TIMEOUT

# Print server and port information.
info:
    echo "Server $SERVER"
    echo "Port: $PORT"

