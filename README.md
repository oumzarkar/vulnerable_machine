<h1 style="font-size: 36px;">INSTRUCTIONS</h1>

install vagrant using
<pre><code class="language-bash">apt install vagrant</code></pre>
install virtual box using
<pre><code class="language-bash">apt install virtual box</code></pre>
go to /ctfmeswcoe and type vagrant up
you will find the box when you open the virtualbox

if you wish to know how I have created this machine go though the seminar.pptx
or read my blog [here](https://medium.com/@oumzarkar/how-to-create-your-own-vulnerable-ctf-machines-700b52f87a1e)
also note this box is very old and not upgraded, so it contains many other vulnerabilites which can be exploited to get root access I had choosen this box because it was stable 

if you wish to patach all those vulnerabilites just put 
<pre><code class="language-bash">sudo apt upgrade</code></pre>
in the install.sh 
