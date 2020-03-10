# Peppol Development Kit (PDK)


## Installation (draft)

1. Download package for your platform.
2. Unzip
3. Add environment variabel `PDK_PATH` pointing to the unzipped folder. (Maybe not needed?)
4. Add `$PDK_PATH/bin` to your `PATH` variabel.

## Installation (MacOS)

Installation requires brew package `coreutils`.

For installation with brew:

```bash
brew install https://github.com/.../peppol-pdk.rb
```


## Choices


### Tools

* Ant
  * Shell scripting is a no-go when multi-OS is a requirement.
  * Ant
    * Available as embeddable
    * Requires Java
    * Download: https://ant.apache.org/bindownload.cgi
* Saxon - XSLT, Schematron
  * Requires Java
* VEFA Validator
  * Requires Java
* VEFA Structure
  * Requires Java
* Asciidoctor
  * Using JRuby
  * Current script for detection of resources need to be rewritten.
* Hugo?
  * Standalone (Go-based)
* Simple web server?
  * `jruby -run -e httpd . -p 8000`
  * https://github.com/planetruby/awesome-webservers#webrick
* Scripts?
  * Ruby


### Runtimes

* Java
  * ~~Oracle edition is not allowed to be redistributed.~~
  * ~~RedHat version seem to be usable.~~
    * Download: https://developers.redhat.com/products/openjdk/download
  * Amazon Corretto (GPLv2)
  * ~~OpenJDK (Docker only?)~~
  * AdoptOpenJDK?
* Ruby
  * JRuby
  * Scripting
