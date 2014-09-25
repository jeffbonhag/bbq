bbq
===

A Docker build environment for http://screen.bbqdroid.org/

Fun times to be had by all.

    $ git clone https://github.com/jeffbonhag/bbq
    $ cd bbq
    $ wget https://github.com/FFmpeg/FFmpeg/archive/n2.4.1.zip
    $ make
    
I use `make` to build Docker containers.  Is that cheesy?

Getting the files you built
---------------------------

After running `make`, you can pull FFmpeg and BBQScreenClient2 off the running container:

    $ make run

    ( in another tmux pane/terminal tab: )
    
    $ docker ps
    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    172c3d1cd14a        bbq:latest          "/bin/bash"         11 minutes ago      Up 11 minutes                           condescending_tesla
    
    $ docker cp 172c3d1cd14a:FFmpeg-n2.4.1 .
    $ cd FFmpeg-n2.4.1
    $ sudo make install
    
    $ cd ..
    $ docker cp 172c3d1cd14a:/bbqscreen_client/Linux/BBQScreenClient2 .
    $ sudo mv BBQScreenClient2 /usr/local/bin
    
Adding /usr/local/lib to your library path
------------------------------------------

  Create a file with the library path `/usr/local/lib`:
    
    $ sudo sh -c 'echo /usr/local/lib >> /etc/ld.so.conf.d/local.conf'
    
  Refresh the library path:
  
    $ sudo ldconfig
    
Whew.

