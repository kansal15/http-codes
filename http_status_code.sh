#!/bin/bash
URL=${1}

if [ "$#" -lt 1 ]; then
    echo "Usage: ./`basename $0` URL"
    exit 1
fi

function unknown_status() {
    if [ "${code::1}" == "4" ]; then
        echo "Unknown Client Error"
        exit 1
    fi

    if [ "${code::1}" == "5" ]; then
        echo "Unknown Server Error"
        exit 1
    fi

    echo "${code} !! `basename $0`: status not defined."
    exit 0
}

code=$(curl -Ik --write-out %{http_code} --silent --no-keepalive --output /dev/null $URL)

case $code in
     000) echo "${code} Not responding" ;;
     100) echo "${code} Informational: Continue" ;;
     101) echo "${code} Informational: Switching Protocols" ;;
     102) echo "${code} Informational: Processing" ;;
     103) echo "${code} Informational: Early Hints" ;;
     200) echo "${code} Successful: OK" ;;
     201) echo "${code} Successful: Created" ;;
     202) echo "${code} Successful: Accepted" ;;
     203) echo "${code} Successful: Non-Authoritative Information" ;;
     204) echo "${code} Successful: No Content" ;;
     205) echo "${code} Successful: Reset Content" ;;
     206) echo "${code} Successful: Partial Content" ;;
     207) echo "${code} Successful: Multi-Status" ;;
     208) echo "${code} Successful: Already Reported" ;;
     218) echo "${code} Apache Web Server: This Is Fine" ;;
     226) echo "${code} Successful: IM Used" ;;
     300) echo "${code} Redirection: Multiple Choices" ;;
     301) echo "${code} Redirection: Moved Permanently" ;;
     302) echo "${code} Redirection: Found residing temporarily under different URI" ;;
     303) echo "${code} Redirection: See Other" ;;
     304) echo "${code} Redirection: Not Modified" ;;
     305) echo "${code} Redirection: Use Proxy" ;;
     306) echo "${code} Redirection: status not defined" ;;
     307) echo "${code} Redirection: Temporary Redirect" ;;
     308) echo "${code} Redirection: Permanent Redirect" ;;
     400) echo "${code} Client Error: Bad Request" ; exit 1 ;;
     401) echo "${code} Client Error: Unauthorized" ; exit 1 ;;
     402) echo "${code} Client Error: Payment Required" ; exit 1 ;;
     403) echo "${code} Client Error: Forbidden" ; exit 1 ;;
     404) echo "${code} Client Error: Not Found" ; exit 1 ;;
     405) echo "${code} Client Error: Method Not Allowed" ; exit 1 ;;
     406) echo "${code} Client Error: Not Acceptable" ; exit 1 ;;
     407) echo "${code} Client Error: Proxy Authentication Required" ; exit 1 ;;
     408) echo "${code} Client Error: Request Timeout" ; exit 1 ;;
     409) echo "${code} Client Error: Conflict" ; exit 1 ;;
     410) echo "${code} Client Error: Gone" ; exit 1 ;;
     411) echo "${code} Client Error: Length Required" ; exit 1 ;;
     412) echo "${code} Client Error: Precondition Failed" ; exit 1 ;;
     413) echo "${code} Client Error: Request Entity Too Large" ; exit 1 ;;
     414) echo "${code} Client Error: Request-URI Too Long" ; exit 1 ;;
     415) echo "${code} Client Error: Unsupported Media Type" ; exit 1 ;;
     416) echo "${code} Client Error: Requested Range Not Satisfiable" ; exit 1 ;;
     417) echo "${code} Client Error: Expectation Failed" ; exit 1 ;;
     418) echo "${code} Client Error: I'm a teapot" ; exit 1 ;;
     419) echo "${code} Laravel Framework: Page Expired" ; exit 1 ;;
     420) echo "${code} Spring Framework: Method Failure" ; exit 1 ;;
     421) echo "${code} Client Error: Misdirected Request" ; exit 1 ;;
     422) echo "${code} Client Error: Unprocessable Entity" ; exit 1 ;;
     423) echo "${code} Client Error: Locked" ; exit 1 ;;
     424) echo "${code} Client Error: Failed Dependency" ; exit 1 ;;
     425) echo "${code} Client Error: Too Early" ; exit 1 ;;
     426) echo "${code} Client Error: Upgrade Required" ; exit 1 ;;
     428) echo "${code} Client Error: Precondition Required" ; exit 1 ;;
     429) echo "${code} Client Error: Too Many Requests" ; exit 1 ;;
     430) echo "${code} Shopify: Request Header Fields Too Large" ; exit 1 ;;
     431) echo "${code} Client Error: Request Header Fields Too Large" ; exit 1 ;;
     440) echo "${code} Internet Information Services Error: Login Time-out" ; exit 1 ;;
     444) echo "${code} NGINX Error: No Response" ; exit 1 ;;
     449) echo "${code} Internet Information Services Error: Retry With" ; exit 1 ;;
     450) echo "${code} Microsoft: Blocked by Windows Parental Controls" ; exit 1 ;;
     451) echo "${code} Client Error: Unavailable For Legal Reasons" ;;
     460) echo "${code} AWS Elastic Load Balancer Error: Client closed the connection with the load balancer before the idle timeout period elapsed." ; exit 1 ;;
     463) echo "${code} AWS Elastic Load Balancer Error: The load balancer received an X-Forwarded-For request header with more than 30 IP addresses." ; exit 1 ;;
     494) echo "${code} NGINX Error: Request Header Too Large" ; exit 1 ;;
     495) echo "${code} NGINX Error: SSL Certificate Error" ; exit 1 ;;
     496) echo "${code} NGINX Error: SSL Certificate Required" ; exit 1 ;;
     497) echo "${code} NGINX Error: HTTP Request Sent to HTTPS Port" ; exit 1 ;;
     498) echo "${code} Esri: Invalid Token" ; exit 1 ;;
     499) echo "${code} NGINX Error: Client Closed Request" ; exit 1 ;;
     500) echo "${code} Server Error: Internal Server Error" ; exit 1 ;;
     501) echo "${code} Server Error: Not Implemented" ; exit 1 ;;
     502) echo "${code} Server Error: Bad Gateway" ; exit 1 ;;
     503) echo "${code} Server Error: Service Unavailable" ; exit 1 ;;
     504) echo "${code} Server Error: Gateway Timeout" ; exit 1 ;;
     505) echo "${code} Server Error: HTTP Version Not Supported" ; exit 1 ;;
     506) echo "${code} Server Error: Variant Also Negotiates" ; exit 1 ;;
     507) echo "${code} Server Error: Insufficient Storage" ; exit 1 ;;
     508) echo "${code} Server Error: Loop Detected" ; exit 1 ;;
     509) echo "${code} Apache Web Server/cPanel: Bandwidth Limit Exceeded" ; exit 1 ;;
     510) echo "${code} Server Error: Not Extended" ; exit 1 ;;
     511) echo "${code} Server Error: Network Authentication Required" ; exit 1 ;;
     520) echo "${code} Cloudflare Error: Web Server Returned an Unknown Error" ; exit 1 ;;
     521) echo "${code} Cloudflare Error: Web Server Is Down" ; exit 1 ;;
     522) echo "${code} Cloudflare Error: Connection Timed Out" ; exit 1 ;;
     523) echo "${code} Cloudflare Error: Origin Is Unreachable" ; exit 1 ;;
     524) echo "${code} Cloudflare Error: A Timeout Occurred" ; exit 1 ;;
     525) echo "${code} Cloudflare Error: SSL Handshake Failed" ; exit 1 ;;
     526) echo "${code} Cloudflare Error: Invalid SSL Certificate" ; exit 1 ;;
     527) echo "${code} Cloudflare Error: Railgun Error" ; exit 1 ;;
     529) echo "${code} Qualys: Site is overloaded" ; exit 1 ;;
     530) echo "${code} Cloudflare Error: 1XXX Error" ; exit 1 ;;
     561) echo "${code} AWS Elastic Load Balancer Error: Unauthorized" ; exit 1 ;;
     598) echo "${code} Server Error: Network read timeout error" ; exit 1 ;;
     *) unknown_status ;;
esac

exit 0
