/LoadModule cgi_module/s/#//g
/LoadModule cgid_module/s/#//g
/<Directory .*cgi-bin/,/<\/Direct/c\
<Directory "/usr/local/apache2/cgi-bin">\
    AllowOverride None\
    Options None\
    Require all granted\
    Options +ExecCGI\
    AddHandler cgi-script .cgi .sh .awk .py\
</Directory>
