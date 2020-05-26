## Creating a shiftr.io namespace

Go to www.shiftr.io it should look like this:

![enter image description here](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/blob/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/Creating%20a%20Shiftr.io%20Namespace/images/shiftr.io.png?raw=true)

Create an account & Login. Go to your profile, it should look like (although slightly different to) this:

![enter image description here](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/blob/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/Creating%20a%20Shiftr.io%20Namespace/images/dashboard.png?raw=true)

Now click "New Namespace" you should see this:

![enter image description here](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/blob/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/Creating%20a%20Shiftr.io%20Namespace/images/create%20new%20namespace.png?raw=true)

Give it a name and a description if you want. Make it private or not it doesn't really matter.


Go to your Dashboard, Click on the new namespace, it should look like this:

![enter image description here](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/blob/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/Creating%20a%20Shiftr.io%20Namespace/images/namespace.png?raw=true)

Then click "Namespace Settings" it should look similar to this:

![enter image description here](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/blob/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/Creating%20a%20Shiftr.io%20Namespace/images/namespace%20settings.png?raw=true)

Click "Add Token" it should look like this:

![enter image description here](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/blob/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/Creating%20a%20Shiftr.io%20Namespace/images/add%20token.png?raw=true)

Use the default key and secret and click 'Create Token'.
You now have a namespace with a working all-access token. If you go back to the token settings you will be able to edit the Key and Secret whenever you like.

The 'Key' and 'Secret' are important for setting up shiftr.io in the Arduino IDE. However, within Processing you use the whole token address as you can see here listed as "mqtt://3130a062:26739bf9b9796972@broker.shiftr.io".

![enter image description here](https://github.com/josephlyons/FACE_CONTROL_DIGITAL_TOOLKIT/blob/master/IDEAS%20BOOK/PHYSICAL/1.%20PINBALL/ESP32%20Enabled/Creating%20a%20Shiftr.io%20Namespace/images/example%20token.png?raw=true)



