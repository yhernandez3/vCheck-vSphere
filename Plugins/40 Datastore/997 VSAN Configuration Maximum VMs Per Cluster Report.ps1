$Title = "VSAN Configuration Maximum VMs Per VSAN Cluster Report"
$Header =  "VSAN Config Max - VMs Per VSAN Cluster"
$Display = "Table"
$Author = "William Lam"
$PluginVersion = 1.1
$PluginCategory = "vSphere"

# Start of Settings
# Percentage threshold to warn?
$vsanWarningThreshold = 50
# Maximum number of VMs per vSAN cluster (depends on vSAN version) ? 
$vsanTotalVMsPerClusterMaximum = 3200
# End of Settings

# Update settings where there is an override
$vsanWarningThreshold = Get-vCheckSetting $Title "vsanWarningThreshold" $vsanWarningThreshold


foreach ($cluster in $clusviews) {
   if($cluster.ConfigurationEx.VsanConfigInfo.Enabled) {
      $totalVMs = (Get-View -ViewType VirtualMachine -SearchRoot $cluster.MoRef -Property Name).Count
      $checkValue = [int]($totalVMs/$vsanTotalVMsPerClusterMaximum * 100)

      if($checkValue -gt $vsanWarningThreshold) {
         New-Object -TypeName PSObject -Property @{
            "Cluster" = $cluster.Name
            "TotalVMCount" = $totalVMs }
      }
   }
}


$Comments = ("VSAN hosts approaching {0}% limit of {1} VMs per VSAN Cluster" -f $vsanWarningThreshold, $vsanTotalVMsPerClusterMaximum)

# Changelog
## 1.0 : Initial Release
## 1.1 : Add Get-vCheckSetting and code refactor
