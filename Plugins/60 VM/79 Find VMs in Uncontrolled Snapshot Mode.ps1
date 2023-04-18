#region Internationalization
################################################################################
#                             Internationalization                             #
################################################################################
# Default language en-US
Import-LocalizedData -BaseDirectory ($ScriptPath + '\Lang') -BindingVariable pLang -UICulture en-US -ErrorAction SilentlyContinue

# Override the default (en-US) if it exists in lang directory
Import-LocalizedData -BaseDirectory ($ScriptPath + "\Lang") -BindingVariable pLang -ErrorAction SilentlyContinue

#endregion Internationalization

$Title = "VMs in uncontrolled snapshot mode"
$Header = "VMs in uncontrolled snapshot mode: [count]"
$Comments = "The following VMs are in snapshot mode, but vCenter isn't aware of it. See http://kb.vmware.com/kb/1002310"
$Display = "Table"
$Author = "Rick Glover, Matthias Koehler, Dan Rowe, Bill Wall"
$PluginVersion = 1.6
$PluginCategory = "vSphere"

# Start of Settings
$ExcludeDS = "ExcludeMe"
# End of Settings= 
# End of Settings
