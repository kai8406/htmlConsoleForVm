# htmlConsole
html5 console for vmware vm

# summary
There are some examples of vm html console using webmks sdk.

# vsphere 6.5
There are very simple way to access vm html console in vsphere 6.5 environment using pyvmomi with python in the way of input url to browser generated from <a href="https://github.com/vmware/pyvmomi-community-samples/pull/342" >generate_html5_console.py</a>. but scheme of html output can't be changed easily for this's a web page intergrated in vcenter server, and it fails with the vm having chinese name as the parameter 'cfgFile' being converted. perhaps you can get it using str.format().



