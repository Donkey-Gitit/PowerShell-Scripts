Connect-MgGraph 
[Array]$Skus = Get-MgSubscribedSku
# Generate CSV of all product SKUs used in tenant
$Skus | Select SkuId, SkuPartNumber, DisplayName  | Export-Csv -NoTypeInformation c:\temp\ListOfSkus.Csv
# Generate list of all service plans used in SKUs in tenant
$SPData = [System.Collections.Generic.List[Object]]::new()
ForEach ($S in $Skus) {
   ForEach ($SP in $S.ServicePlans) {
     $SPLine = [PSCustomObject][Ordered]@{  
         ServicePlanId = $SP.ServicePlanId
         ServicePlanName = $SP.ServicePlanName
         ServicePlanDisplayName = $SP.ServicePlanName }
     $SPData.Add($SPLine)
 }
}
$SPData | Sort ServicePlanId -Unique | Export-csv c:\Temp\ServicePlanData.csv -NoTypeInformation