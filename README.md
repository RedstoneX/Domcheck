# Domcheck
check domain name availability with bash  
Original script inspiration from:  
https://linuxconfig.org/check-domain-name-availability-with-bash-and-whois  
https://gist.github.com/hotheadhacker/873519dea910b70bfc0137c527583056  
and using Chat GPT 4o to make improvements

dependency: apt install whois

Running an example search for the Domain 'exampledomain'  
./domcheckv4.sh exampledomain  

**Checking domain availability...**

| Available Domains      | Not Available Domains  |
|------------------------|------------------------|
| exampledomain.mobi     | exampledomain.com      |
| exampledomain.ai       | exampledomain.net      |
| exampledomain.app      | exampledomain.org      |
| exampledomain.blog     | exampledomain.info     |
| exampledomain.co       | exampledomain.us       |
| exampledomain.tel      | exampledomain.cc       |
| exampledomain.biz      | exampledomain.xyz      |
|                        | exampledomain.ca       |
