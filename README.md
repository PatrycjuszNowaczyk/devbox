# DEVBOX
author: Patrycjusz Nowaczyk

email: [patrycjusz.nowaczyk@gmail.com](mailto:patrycjusz.nowaczyk@gmail.com)

This is small devbox for development.

### Prerequisites:

You need to have installed:
```
- docker
- make
```
___
## Usage


In order to use this devbox you need to clone this repository into your project root directory with command:
```bash
git clone https://github.com/PatrycjuszNowaczyk/devbox.git
```

> **Note:** This will create `devbox` directory in your project root directory.

Enter `devbox` directory and run:
```bash
make init
```
> **Note:**
> This will create all necessary files and directories.

At first start you will be asked to create certificates
for your application to run on `https://localhost`.
Follow the instructions in terminal to create certificates.

When everything is completed, your project structure should look like this:
```
│ project_root/
    │ app/
        index.php
    │ devbox/
```

`app` directory is your application root directory.

After that in order to skip warning about self-signed certificate in your browser you have to add authority certificate to browser trusted certificates store.


>   ### Step 1 - optional
>   On Ubuntu you can add authority certificate to trusted certificates on your system, but it is optional.
> 
>   It doesn't have to be done if you are using Firefox or Chrome.
> 
>   ```bash
>   sudo cp ./devbox/docker/nginx/ssl/dev_cert_ca.cert.pem /usr/local/share/ca-certificates/dev_cert_ca.crt
>   ```
>   > **Note:**
>   > Target directory may vary depending on your system. Also note that the file name has been changed.
>
>   and then run:
>   ```bash
>   sudo update-ca-certificates
>   ```
>   > **Note:**
>   > This will add your certificate to trusted certificates on your system.
>   >
>   > In terminal, you will see something like this:
>   > ```
>   > Updating certificates in /etc/ssl/certs...
>   > 1 added, 0 removed; done.
>   > Running hooks in /etc/ca-certificates/update.d...
>   > done.
>   > ```
>
>   ___
>   ### Step 2
>   Add authority certificate to your browser trusted certificates store.
>
>   #### Firefox:  
>
>   Open Firefox.
>
>   1. Click on the menu button and select "Settings".
>   2. Scroll down to the "Privacy & Security" section.
>   3. Scroll down to the "Certificates" section and click on "View Certificates".
>   4. In the "Certificate Manager" window that opens, click on the "Authorities" tab, and "Import" button.
>   5. Navigate to the location of your certificate file
>
>      `(/usr/local/share/ca-certificates/dev_cert_ca.crt)`
>
>      and import a .crt file.
>   6. Check the box that says "Trust this CA to identify websites" and click "OK".
>
> 
>   #### Chrome:  
>   Open Chrome.
>
>   1. Click on the menu button and select "Settings".
>   2. Under the "Privacy and security" section, click on "Security".
>   3. In the window that opens, click on the "Manage certificates".
>   4. In the "Certificates" window, click on the "Authorities" tab and then click on "Import".
>   5. Navigate to the location of your certificate file
>
>      `(/usr/local/share/ca-certificates/dev_cert_ca.crt)`
> 
>      and import a .crt file.
>   6. Check the box that says "Trust this certificate for identifying websites" and click "OK".
>___
> 
>   And you are good to go.
> 
>   More information about adding certificate to your browser can be found [here](https://support.securly.com/hc/en-us/articles/206081828-How-do-I-manually-install-the-Securly-SSL-certificate-in-Chrome).

After adding certificate to be trusted one, you can run:
```bash
make up
```

This will start the application, and you can access it by entering [https://localhost](https://localhost) in your browser.

___

## Future improvements

`main` branch will be used only as starting point.

There will be created new branches for new development environments.
For example:
- symfony
- symfony-api
- nodejs

This will allow to have different environments for different projects.

To manage branches the Makefile will be used.

All changes will come if needed.

___
## Credits
Thanks for `Tomasz Malaika` for inspiration.

This is based on his devbox I used for project we have been working on in cooperation with `Łukasz Szor`.

`Big thanks to both of them.`
