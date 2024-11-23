# Dnsperf testing

## How to

1. Install [dnsperf](https://github.com/DNS-OARC/dnsperf), [just](https://github.com/casey/just), [nushell](https://github.com/nushell/nushell) on your machine.

2. Clone this repository and navigate to the directory.

3. Configure the `./.env` file with your desired settings.

4. Download the Domains list from [here](https://radar.cloudflare.com/domains) and save it into `./data/raw`

5. Run the `just generate` command to generate the domains list.

6. Run the `just test` command to start the dnsperf test.

