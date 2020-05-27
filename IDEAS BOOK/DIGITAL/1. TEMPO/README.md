# Eyebrow Controlled Tempo


Max for Live patch allowing you to control the master tempo in Ableton Live using your eyebrows via facial landmarking software.


## Softwares Guide



Quick terminology guide for softwares used in this project.

​

**Ableton Live**

Ableton Live is a digital audio workstation for macOS and Windows.

​

**Max/MSP**

Max is a visual programming language for the specialized needs of artists, educators, and researchers working with audio, visual media, and physical computing.

​

**Max for Live**

Max for Live \(M4L\) is a platform to build your own instruments and effects, tools for live performance and visuals, and more. It is an implementation of the Max/MSP software within Ableton Live

​

**FaceOSC**

FaceOSC sends as much data as possible from ofxFaceTracker via OSC, including its pose/position and gestural data, and its raw points.

​

**OSC**

Open Sound Control \(OSC\) is a protocol for communication among computers, sound synthesizers, and other multimedia devices that is optimized for modern networking technology.



## 1. Install FaceOSC









First step is to install Face OSC:

https://github.com/kylemcdonald/ofxFaceTracker/releases

​

This software will use your webcam to track locations on your face and give numeric measurements for a series of values. It will then send this over OSC.















## 2. Install Ableton Live







You can try Ableton Live free for 30 days which will allow you to experiment with this hack, but will need to purchase it \(or borrow a license from a friend, like I am\) if you wish to use it for longer.

​

https://www.ableton.com/en/trial/








## 3. Open Max for Live









Inside Ableton Live open the Max for Live editor via; 'Max for LIve/Max MIDI Effect/Max MIDI Effect.' Then clicking on the left of the three buttons on the top right of the Device that opens.

This is where you will save the patch.

​

![image](https://wikifactory.com/files/RmlsZTozMTczNzU=)

_Figure 1 - Pathway for finding the M4L editor._









## 4. Download the M4L Patch


This is a compressed copy of the M4L patch, copy and paste this into your M4L patch:

​

> &lt;pre&gt;&lt;code&gt;
>
> ----------begin\_max5\_patcher----------
>
> 3794.3oc6cs0iiaaE94I.4+fpQepXhGd+RAR.Ru7VK5CMukDrP1VyLZisjgr
>
> 7jcSP2e6khTxirsjHsLEGiN0KVO1xx9P9wycdH4u+0e0cyVj+ojcyh9yQ+Xz
>
> c286pqbm9ZUW4tlKb2rMweZ453c5abV19MKRJlce8msMtHdSRYRwGRxhWrNo
>
> 5d.Men5dSyVmTp+lvVWMeeYykQu9KUt74zrm9PQxxRSah.nyA2Gwkhp+PAUO
>
> iTOG8yMeozU5FU9hO9MDxgFk4mu7yaSL+NylcezrEwYOMK5m02x+4q+pp+p9
>
> y8N2w2jraW7SIGHRYxmzMyYqSeI4C6RJi9gh3k+Rz+L8SIE+sjWRWlDsKW0e
>
> JS1rMeVmXBpaLANDlfHUv.Vp+CTxGFTvC.JSAXrsHeaRQ4midId89DK85Gyy
>
> JyTrO5u42WjFud1kCHXlFBXDT0eDZVEDpG7.yGDOZ2v1k9a5OAp9sFMNkk7q
>
> Jx1MOybUm44YCKq3LBgGDgz7JTAV+G1vHDaXwH8+CMRkuXWRwKsT6bk7SH67
>
> SbflSR.FFsDVPq9QplquK9kjUeP8ioZAeHtrrHcw9RiV46dErta1GTxU6R2U
>
> ljsznk07A0X8nvbM1tpML8RbwA.7u+4jEE4+5qp5KR1kjUFWllm0BufPMPwj
>
> yo2GI0vEQzFt5xDAbX191jZj1NnPotoflKUinPBlSApGLUiTPNuQ1dL0hgjG
>
> WmGW1Zf0L.dXjanwPsRw7Gat9gOnMH0PsFFji9v8Yok6J+7wf3Q2wFEdV8gz
>
> 4c9CrVYQ5zQ3ne3YEd+b95Uy55qjpnohGoiQuSHbrlYS1Mgq+UL3n3.5cz8n
>
> ZCEkCz5p+JMr7WEu+x7MaTrXmqvYw1MQOptsmsw3iXZNLHlTw4yf52bDS0Uw
>
> bCFf4lw0jlWoXGAIDVM2sjoZH3yaHs4tm4eH6enziD8SYMCX+T12mEu9yJkU
>
> Gt00oYIKy2mUdrsp1.qC2RKrWqmwnn1XUi1t+t3ok4qyKL2KXtj.gJrhCnBA
>
> BqFr.yo3idTcI.CwITfT.vRDjouT.FKQFqyPnwQN148lJb939ijA3BBFh4HJ
>
> QduiWB1CKwq9DsX+BkH99cI6zz6beQNX.iLAl5eJtLHdLJwf4Bf.QE.yCD13
>
> PsZ3GqXLzxRPEaBDLr0eHHrdSpr7n5kWSrWdwCINQKxgffy09P6.wdLuXSr9
>
> 6x5RgD1o317NX1aHLJC.1T8ioZ8uTipGSHGzd0V3B2qiJRFhsVf0MGLqqgkN
>
> ZiSsZEL8xkNHu5W7SEwqRSLlC.8nXWvTO322yqNxfvioqWq+tGbv5UJz0coe
>
> FdUDR+L55+IZ9EP225IX2eg38k4Ggby4xIPDoRlL.ZpYFILEiraZZZqalKuM
>
> B0eWxZkOhgHxUtNrxHDWCVh5PdfPhxoPKfkX.KYlA6vBZ+Rxm6Fw.WLhQriX
>
> eiJHQtfBYLDQJkBgKHFreDKsRmRW+InlwRdJM6gkqSW9KQkwasGFuNLFnx2H
>
> smOZmRQr2ZiZbhNuB0A5bDOMDBNuMdzPD5x0.PmhgBHBDBskp.WLoFFb4ZKE
>
> 3ajDilGupeqKvIAuvcfWVc8WPrnwLjx5vfD1jYtFnUo83T3BipjRG.sn2FrW
>
> kQqiVOKDwHYxJJlX7bARax+HzAvhM5jJ6c.62VG8w7zrv39hAxfc.YDnEoQ9
>
> sCjsIINKHrXHQuNGaEuFXdKL42d57X4zrXzSF9Lo3y3flRjPOGCLayqP2AJZ
>
> RM6gmbHudCL.UVjdTTYJOT.5fxN+EsarW3LZT0.dLdYhU+iLLADbGLAchZcj
>
> LloNQ.Pg7hRwyymBwj6O5oVTQM1ktQwLoiz8vfuhcq4pDPqq2lEl155pwfUI
>
> KS2Dud6ZElaXEFM+8h8kk4Y9qBIf1CfABLC+XQi+wLyT.LvDA.k.qdv3ccio
>
> OF8GeD9ceKADU9bRV0ahRVuKIR0BPQ9zwugzbxLETBRYb9rIGDxICVQEPIbb
>
> lZ.Sfol+vCp3TUOlGjjwHqYn5vcYhzBngrYuIfnVY5lvTJAMHVU1WqjNg0HF
>
> pJnCK.F1ACzSAn0aLF+15kqShKBRfrDi7oXDo8SRtcR6GFED+lol4AE1QbY1
>
> xhkj99LueFHiIFCjwtwS7WPRF.WnQPAkd4ICPxe+kqoF7BvGAGmH7oZpL+om
>
> VmDFmXEXSoax5.aP.K1IkCKMdE9vdJDzyTAWmvbSU.0kO2i.67RhyQ8VhPV.
>
> UD.LYf5oAG0Sv+lxtjqwTiEeJXbw9qhSUGf5887JeUhOv1HltTl5O.VFucO4
>
> b4AlQdnRivEOzAcVWwBUy7W5LKIf5WMEEHdPlIDl.0qKQ3g01h.n2eVmpwqw
>
> 3ODBfCu0o25JHqVBkKQWLdE3pRHnIip1jibLlbHgOYT54F+KAYlFq0nSQiP9
>
> ZfPz1k9TVUMUGNIrUwK+hujv.NfXR9HPrWiPaxwiu6a+Rk4R.Ljpc.cDzEmZ
>
> AT32RrQIqdJ4KgHUuMPVWyOhU9Hg8jiDZKbwK1ERMVL9XvM4MkFqj0kwAEyH
>
> i.yFpTxmNL6FofxEv9qrjKufxQPzaSEkeSTSSRMOHgzkm7PK7f3+GOOS0XCu
>
> CrARMyTSuXCYxRIRerMaeNdWdQk6Ez.5bAC1kyEDKbN2T9nVF02Dh5WYMIE0
>
> qZKjzBhwF4DhNYkndHlppFDC2UdYrgX7aqoppLZQTZTZHV.+0JtnfQjdFnCN
>
> wNsSTUe.3eJJL0sPC50YcqxrfdxaHwzph8HLHVs+XcIlRs3DAB7VfXW8lRy4
>
> 3Vzeo0Bh+RzwY13Hf39KdgdyBF6x7bsU0ug5p32jRY3pOjpc.G8VcSze7xsk
>
> LDXCc.rqVz6m4zBxBXOhk7.X51gSp1+OBNtIYcvjJsfajQgaW69cB752yG5e
>
> WKJt74nl8wofMH.Av9UUvgVFEn2PbuiZmLZHXC6Br0kPO0FrcEauQf2TKTWv
>
> 1lV8lVDE+5hlypsGHG+Fs+owmiYbPKOs5aEJJeceFheEKOwi467PoVfIlBvS
>
> 6KofL3hRj.B6ZRrOw18Yaq1r5.yGSrxi00HknpYwJzlujIFluD5xRUYxpgXG
>
> qWEyNADf2ZWg.+1WCP0JBf7CEa7f.c3mA1x7mplInPLQPMXgIMCjg21DslIT
>
> KYQdJLz9cJIUbHh9qAoL6HQVJTcLxVdQ8N.ciLoEPjt5zzq7pQMMEx2lYo3F
>
> A9LaSYDybRLhcMHvs0b77u92+0uoP0RRhd3WSWohl3gmSRe54xPjdPV8x92L
>
> EFlhvo+crR3ay964shTqhgCJUOXx5GUYADORtPD6csLb0Nvw4fICLRvjeyJR
>
> uN4wxnGJBk.cm3JRZ1XGQVR.q3cs7MBPlqWRjr581OfnJSAxQxRReWKeinv4
>
> 7pMDIdMannZINPFqxRx6avDHliq.QbiPMRgei16Q36aKOTdGfY89b9kCln+u
>
> kmAvUkoHmr7fee6YoPAcpGnFkkR5q649WNKI38s7MCcNXxPiDLg722fItCNy
>
> 5sVyQ.lhaKkk0Yx9wp+EDUjcglTST2LokUxqyox99IrZItU1FoQyq19aYGL0
>
> vOfiifq78cj3l5pa7JHeeGmi4.LYzJDeihq4joTNNKK+0YKZ1mtAxNj4Dzo2
>
> vEaggraUaJyBE6Wsmhlb41KNQt14BchCWYa9tzJVvnG1sLds5B4EoGlDSOAk
>
> DqPIvDnBbXrD4P3JAtlhagjU83midHo9LUo5EQO7wX0qxx2UVjtdmuvSl0oV
>
> ndp.QzgWigPGAz2VfUwhpd9ojck6KTu3w78YqBFqIwL0phgWOETwsGq49UaU
>
> 8kjpS5GAt0wd1TtVld8bwQNri0TlOVU8laTeVEc5ghot0U8Am.c6x2WrrgR0
>
> Ku+nVswUJ1rzrCVk+wV6RGQCt8Z3LAq3UhP1nHyuzydOzuzCZiddDOYtz+ZP
>
> AOPvpinS6DD6uQPhS.J0qzyZ+CR7F8vNwgR7HA4NMBdRy5nMHHkKKxp845te
>
> kT+J+zVYtL52zi7AAoNM7Kv9ihNwvUU3RQdBSQN0E8XOD5TOD3WBZkqAI8FA
>
> QtYkg6WBZuG5OsvHmTZnq90ni1vqWsMOMqbWSL1x4ryp.Ci6kPyRH3j2UWrP
>
> MmUXG8NSoQp7xmZdie5nLmrnpWVIsGANsmBPb8NrWqS2D8g0CSpbOj12m4ot
>
> .0stfGYOXX2QMeQRjajzeJxPt0IQ9kf1Ey8m6j50CoCcQnG6iP2BBwit3gft
>
> ouFJ8LIgtQRnGIIxNIOQ09yoqVkjY4PE3BZEb2vZ1z1JXtyj4K32MsvPfGYx
>
> HtQRgGIoa5DOsk46gWT30g3llRfG0g.bLcMdzOSfSZJ8nRKfapK.djEF3lfJ
>
> 3DUH4EqRJ7FG7kzHfczH.doQPtHq+836KmBqbuUfqNuRjbAz3dKGBqNceDyg
>
> XjjzD..leI2IkAmSvX.nwkYd0WGwza7xm+YS1fkaIIRP6giwOCVto4E3QW0.
>
> tolE3QSZ.najziZ1A.W04McisNZbgLkpjbJuj9C1cwYUe5QtS4U1egHq26+u
>
> .yLdgjNY8VeBW3MR5VhhjRORRlajj5QRRCshP8IEjK1b74XI1MfE4QR5jVGL
>
> dBU95XaPexpMYJeM+510OIIdD6ggmCC3FT223MJzMB3jMd6Vi.Lgt+qMtZOe
>
> Q9TmlaLb9kf1Ep7HCtvMi9LKQTg0SX.QXJQQtd6f332UudpkP74uCgLmlSR5
>
> 4uCZVLwRnYJIvGcpn5W1KGwhSSAsekyDt4Rjvi9mHbykHgGc7S3z7le.L7FI
>
> cz5Q+yaF2LsYXN3nSUajPTePBX4y.fyOMt4D8lvTGelm54zPmaYnfD5xT3vu
>
> UHEbbbF9nVRGU85Ar9rGtdhYOt577rlNG8fbZ0z4n6bdzdt.bQ8aePRtL3rk
>
> tIH3uIkE51zUR.So+ot0FNs1h7qXE75jpBXafimRIavEk8YePQmF6gdkd1mq
>
> bgWoG1J87KdRrROhWom8.651Yg5xLOd61Wp1gaMeEColsI9ilhBUbu48oYl2
>
> apS9YEIujt6nMDvYwEKeNsLYY0xYvrxuZ1fdmsIWIjjsOsQNopyVQZc09WUd
>
> 961Fa5V5UEvW+Upa3+5wZOaB
>
> -----------end\_max5\_patcher-----------
>
> &lt;/code&gt;&lt;/pre&gt;



​

Once pasted into your M4L it should look like this:

![image](https://wikifactory.com/files/RmlsZTozMTczOTQ=)

_Figure 2 - 'Eyebrow Tap Tempo' M4L Patch_

​

Then save the patch in your Max MIDI Devices, for ease of use save the patch into the existing M4L devices folder.


## 5. Adjust the Threshold

Depending on the natural size of your face and distance between eyebrows and eye, an easy threshold for triggering the 'tap' will be different from person to person. You can adjust this threshold to make the tool easier to use.

​

![image](https://wikifactory.com/files/RmlsZTozMTc2MTU=)

_Figure 3 - The Device open in Presentation Mode in the devices bar inside Max for Live._

​

Here you can see the Device open in Max for Live.

​

The elements shown are as follows:

Middle Left - Live Eyebrow Analysis \(distance from centre of eye to top of eyebrow as measured by FaceOSC.

Bottom Left - Button will flash every time eyebrow is raised above threshold.

Centre - Threshold Control, use this to set comfortable 'tap' height for use with your own face.

Bottom Centre - 'begin/click tap' Use this to begin use of the device or to tap in a tempo using your cursor.

Top Right - BPM/Beats Per Minute, tempo being sent out by the device and also tempo of Ableton Project.

Centre Right - Flashingtempo indicator. In time with Project tempo, turn on and off with Bottom Right.

Bottom Right - Control for flashing tempo indicator.

## Enjoy

FaceOSC will now send eyebrow data from your left eyebrow to the patch, triggering 'taps' which allow you to control the tempo of Ableton Live, and so speed up or slow down the music with your face.

​

[View use.mp4 @ Wikifactory](https://wikifactory.com/viewer/RmlsZTozMTc2NDE=?filename=use.mp4)

_Figure 4 - Me using the device to control tempo \(no sound though\)_

​

Enjoy!
