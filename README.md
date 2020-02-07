# Peppol Development Kit (PDK)


## Installation

1. Download package for your platform.
2. Unzip
3. Add environment variabel `PDK_PATH` pointing to the unzipped folder. (Maybe not needed?)
4. Add `$PDK_PATH/bin` to your `PATH` variabel.



## Choices


### Tools

* Make/Ant
  * Shell scripting is a no-go when multi-OS is a requirement.
  * Make is kind of difficult for Windows users.
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
  * Embedding in Java or creating a Ruby distribution?
  * Current script for detection of resources need to be rewritten.
* Hugo?
  * Standalone (Go-based)
* Simple web server?
  * `jruby -run -e httpd . -p 8000`
  * https://github.com/planetruby/awesome-webservers#webrick
* Scripts?
  * Python?


### Runtimes

* Java
  * Oracle edition is not allowed to be redistributed.
  * RedHat version seem to be usable.
    * Download: https://developers.redhat.com/products/openjdk/download
  * Amazon Corrette
  * OpenJDK (Docker only?)
* Python 3 - Available as embeddable zip file for Windows.
  * Download: https://www.python.org/downloads/windows/
  * Enables:
    * Simple web server
    * Scripts?
* Ruby
  * JRuby
  * Traveling Ruby? https://phusion.github.io/traveling-ruby/
