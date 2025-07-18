��          T               �   �  �   R        p     |     �     �  �  �  �  4  ^   
     f
     r
     w
     �
   
<p>
    <em>Raw</em> connections require the baudrate to be configured on the remote end and will ignore the setting in OctoPrint.
    The remote end needs to pass any data between its socket and the actual device unaltered. As a listener you can use <em>set2net</em> in plain TCP mode, e.g.:
</p>
<pre><code>connection: &my-printer
    accepter: tcp,1234
    connector: serialdev,/dev/ttyUSB0,115200N81</code></pre>
<p>
   or with <em>socat</em>:
  <code>
  socat TCP-LISTEN:1234,reuseaddr,fork GOPEN:/dev/ttyUSB0,b115200,raw,echo=0
  </code>
</p>
<p>
    <em>RFC2217</em> connections pass the baudrate from OctoPrint to the remote end.
    The remote end needs to talk RFC2217 and thus enable OctoPrint to control the serial port parameters. <em>ser2net</em> example:
</p>
<pre><code>connection: &my-printer
    accepter: telnet(rfc2217),tcp,1234
    connector: serialdev,/dev/ttyUSB0,115200N81</code></pre>
 
<p>
    Configure the remote devices that you want to enable connecting to.
</p>
 Hostname/IP Port Remote Connections Type Project-Id-Version: PROJECT VERSION
Report-Msgid-Bugs-To: i18n@octoprint.org
POT-Creation-Date: 2025-07-13 02:55+0200
PO-Revision-Date: 2025-07-13 03:04+0200
Last-Translator: Malte Starostik <malte@starostik.de>
Language: de
Language-Team: German <>
Plural-Forms: nplurals=2; plural=(n != 1);
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.16.0
 
<p>
    <em>Raw</em>-Verbindungen erfordern, dass die Baudrate am anderen Ende eingestellt ist und ignorieren die Einstellung in OctoPrint.
    Das andere Ende muss alle Daten zwischen seinem Socket und dem eigentlichen Gerät unverändert durchleiten. Als Server eignet sich z.B. <em>set2net</em> im einfachen TCP-Modues:
</p>
<pre><code>connection: &my-printer
    accepter: tcp,1234
    connector: serialdev,/dev/ttyUSB0,115200N81</code></pre>
<p>
   oder <em>socat</em>:
  <code>
  socat TCP-LISTEN:1234,reuseaddr,fork GOPEN:/dev/ttyUSB0,b115200,raw,echo=0
  </code>
</p>
<p>
    <em>RFC2217</em>-Verbindugen leiten die Baudrate von OctoPrint an das andere Ende weiter.
    Das andere Ende muss RFC2217 verstehen und somit OctoPrint ermöglichen, die Paremeter der seriellen Schnittstelle zu steuern. Beispiel für <em>ser2net</em>:
</p>
<pre><code>connection: &my-printer
    accepter: telnet(rfc2217),tcp,1234
    connector: serialdev,/dev/ttyUSB0,115200N81</code></pre>
 
<p>
    Richte die entfernten Geräte ein, zu denen eine Verbindung möglich sein soll.
</p>
 Hostname/IP Port Entfernte Verbindungen Typ 