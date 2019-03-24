#!/usr/bin/env bash

# Add a single session to a given Index name & type
# Default values:
# Tenant 4, StartTime = CurrentTime - 1 day, endTime = CurrentTime, Application = 'My web application'

main() {
    ask_index_name
    ask_index_type
    run
}

function ask_index_name() {
    echo -n -e "\nEnter the name of the Index to where add the document, and press [ENTER]: "
    read index_name
}

function ask_index_type() {
    echo -n -e "\nEnter the type of the Index (visit, error, event....) to where add the document, and press [ENTER]: "
    read index_type
    echo $($(date +%s%N)/1000000)
}

run() {
    echo -e "\nAdding Json session to Index $index_name typed as $index_type:\n"
    echo -e "\n Result: \n"
    curl -s -XPOST -H "Content-Type: application/json" "localhost:9200/$index_name/$index_type?routing=XXX" -d "
    {\"tenantId\":\"4\",\"visitId\":\"VisitId-TIDX4-UIDX56-TIME1541754682556\",\"clientTimeOffset\":0,\"startTime\":$(date -v-1d +%s),\"endTime\":$(date +%s),\"duration\":1000,\"visitorId\":\"VisitorId-TIDX00000004-UIDX00000056-123456789\",\"visitTypeSerial\":3,\"applicationTypeSerial\":1,\"bounce\":true,\"newVisitor\":false,\"userActionCount\":1,\"totalErrorCount\":0,\"multiplicity\":1,\"userActionCountMulti\":1,\"totalErrorCountMulti\":0,\"durationMulti\":1000,\"ip\":\"158.37.180.0\",\"geolocationContinentId\":\"GEOLOCATION-EF77F2A17134795A\",\"geolocationContinentName\":\"Europe\",\"geolocationCountryId\":\"GEOLOCATION-E4944342F863128B\",\"geolocationCountryName\":\"Norway\",\"geolocationRegionId\":\"GEOLOCATION-97BEB2DC692FA487\",\"geolocationRegionCode\":\"14\",\"geolocationRegionName\":\"Rogaland Fylke\",\"geolocationCityId\":\"GEOLOCATION-D4672380BE2593DA\",\"geolocationCityName\":\"EJPAIN\",\"browserTypeId\":\"BROWSER-44C8EFE87C847CA6\",\"browserTypeName\":\"Desktop Browser\",\"browserFamilyId\":\"BROWSER-063BCDBF7CC5E9D0\",\"browserFamilyName\":\"AOL Explorer\",\"browserMajorVersionId\":\"BROWSER-E554097144B16C95\",\"browserMajorVersionName\":\"AOL Explorer 9\",\"osFamilyId\":\"OS-C2CE1ED9011FA680\",\"osFamilyName\":\"Windows\",\"osVersionId\":\"OS-F7A02E95841E5DDE\",\"osVersionName\":\"Windows XP\",\"sessionTag\":\"User with id: VisitorId-TIDX00000004-UIDX00000056-123456789\",\"userActions\":[{\"combinedIdentifierNext\":\"2|1||User with id: VisitorId-TIDX00000004-UIDX00000056-123456789\",\"name\":\"Loading of page /wiki/127.0.0.1/first-action-of-visit\",\"domain\":\"kpi.ruxit0001.com\",\"targetUrl\":\"http://kpi.ruxit0001.com:8080/wiki/127.0.0.1/first-action-of-visit\",\"typeSerial\":1,\"startTime\":$(date -v-1d +%s),\"endTime\":$(date +%s),\"duration\":1000,\"encodedApplicationId\":\"APPLICATION-EA7C4B59F27D43EB\",\"applicationId\":\"My web application\",\"errorCount\":0,\"isEntryAction\":true,\"isExitAction\":true,\"apdexTypeSerial\":1,\"networkTime\":7,\"serverTime\":40,\"frontendTime\":953,\"documentInteractiveTime\":404,\"failedImages\":0,\"failedXhrRequests\":0,\"httpRequestsWithErrors\":0,\"thirdPartyResources\":34,\"thirdPartyBusyTime\":320000,\"cdnResources\":1,\"cdnBusyTime\":28000,\"firstPartyResources\":100,\"firstPartyBusyTime\":424000,\"domCompleteTime\":795,\"domContentLoadedTime\":437,\"loadEventStart\":796,\"loadEventEnd\":809,\"navigationStart\":1541754682056,\"requestStart\":3,\"responseStart\":43,\"responseEnd\":47,\"visuallyCompleteTime\":70,\"speedIndex\":28,\"startSequenceNumber\":null,\"durationMulti\":1000,\"typeDomainName\":\"Load|kpi.ruxit0001.com|Loading of page /wiki/127.0.0.1/first-action-of-visit\",\"combinedIdentifier\":\"1|1|kpi.ruxit0001.com|Loading of page /wiki/127.0.0.1/first-action-of-visit\"}],\"events\":[{\"combinedIdentifierPrev1\":\"1|1|kpi.ruxit0001.com|Loading of page /wiki/127.0.0.1/first-action-of-visit\",\"typeSerial\":1,\"name\":\"User with id: VisitorId-TIDX00000004-UIDX00000056-123456789\",\"startTime\":$(date -v-1d +%s),\"applicationId\":\"My web application\",\"encodedApplicationId\":\"APPLICATION-EA7C4B59F27D43EB\",\"combinedIdentifier\":\"2|1||User with id: VisitorId-TIDX00000004-UIDX00000056-123456789\"}],\"errors\":[],\"screenHeight\":960,\"screenWidth\":1280,\"clientHeight\":939,\"clientWidth\":1280,\"screenOrientationSerial\":2,\"displayResolutionSerial\":11,\"isp\":\"UNINETT UNINETT, The Norwegian University & Research Network\",\"clientType\":\"Desktop Browser\",\"endReasonSerial\":1,\"internalSynthetic\":false,\"usesDoNotTrack\":false,\"hasVisualReplay\":false}"
}

main