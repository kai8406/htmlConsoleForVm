# htmlConsole
html5 console for vmware vm

# summary
There are some examples of vm html console using webmks sdk.

# vsphere 6.5
There are very simple way to access vm html console in vsphere 6.5 environment using pyvmomi with python in the way of input url to browser generated from <a href="https://github.com/vmware/pyvmomi-community-samples/pull/342" >generate_html5_console.py</a>. but scheme of html output can't be changed easily for this's a web page intergrated in vcenter server, and it fails with vm having chinese name as the parameter 'cfgFile' being converted. perhaps you can get it using str.format().

Another way of displaying vm html console is using <a href="https://my.vmware.com/web/vmware/details?productId=491&downloadGroup=HTMLCONSOLESDK210" >VMware HTML Console SDK</a>. And there is official <a href="https://www.vmware.com/support/developer/html-console/html-console-21-releasenotes.html#compatibility" >release</a>. It say that installing the vCenter Certificate into the web server providing HTML console is prerequisite from <a href="http://vittoriop77.blogspot.hk/2016/03/vsphere-6-html-console.html#.WN0Z21x95Ny">this site</a>. But I found that it must import certificate to client in which displaying html console in browser.So,I provide some ways to import root CA to client according to different OS and different browser.

