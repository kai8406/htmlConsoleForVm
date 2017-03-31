# htmlConsole
html5 console for vmware vm

# summary
There are some examples of vm html console.

# vsphere 6.5
There are very simple way to access vm html console in vsphere 6.5 environment using pyvmomi with python in the way of input url to browser generated from <a href="https://github.com/vmware/pyvmomi-community-samples/pull/342" >generate_html5_console.py</a>. but scheme of html output can't be changed easily for this's a web page intergrated in vcenter server, and it fails with vm having chinese name as the parameter 'cfgFile' being converted. perhaps you can get it using str.format().

Another way of displaying vm html console is using <a href="https://my.vmware.com/web/vmware/details?productId=491&downloadGroup=HTMLCONSOLESDK210" >VMware HTML Console SDK</a>. And there is official <a href="https://www.vmware.com/support/developer/html-console/html-console-21-releasenotes.html#compatibility" >release</a>. It say that installing the vCenter Certificate into the web server providing HTML console is prerequisite from <a href="http://vittoriop77.blogspot.hk/2016/03/vsphere-6-html-console.html#.WN0Z21x95Ny">this site</a>. But I found that it must import certificate to client in which displaying html console in browser.So,I provide some ways to import root CA to client according to different OS and different browser <a href="https://github.com/zhenmie365/htmlConsole/tree/master/nss">like these </a>.

# vsphere 6.0
According to <a href="https://github.com/zhenmie365/htmlConsole/blob/master/htmlSamples/basic.js">this example</a> It can access to vm html console through three way theoretically. 
<ul>
<li>But I found that webmks ticket way does not get it. </li>
<li>Another two ways came out connection fail error when vm has chinese name. </li>
<li>And I have no idea how to display fullscream. </li>
<li>The prerequisite is add exception of vc certificate which vm belongs to. </li>
<li>Chrome always works while firefox(linux works) and IE occasionally fail. </li>
<li>My success example is <a href="https://github.com/zhenmie365/htmlConsole/blob/master/htmlSamples/htmlConsole6_0UseVcSsl.html">this</a>.</li>
</ul>

# vsphere 5.x
You will get idea from <a href="http://www.virtuallyghetto.com/2014/09/html5-console-now-defaults-to-httpswss-in-vsphere-5-5-update-2.html">this</a>.
