# Varibale Declaration
URL="https://www.tooplate.com/zip-templates/2098_health.zip"
ART_NAME="2098_health"
TEMPDIR="/tmp/webfiles"

yum --help &> /dec/null

if [ $? -eq 0 ]
then
        # Set Variables for CentOS
        PACKAGE="httpd wget unzip"
        SVC="httpd"

        echo "Running Setup on CentOS"
        # Installing Dependencies
        echo "##############################################"
        echo "Installing Packages"
        echo "##############################################"
        sudo yum install $PACKAGE -y > /dev/null
        echo

        # Start & Enable Service
        echo "##############################################"
        echo "Start & Enable HTTPD Service"
        echo "##############################################"
        sudo systemctl start $SVC
        sudo systemctl enable $SVC
        echo

        # Creating Temp Directory
        echo "##############################################"
        echo "Starting Deployment"
        echo "##############################################"
        mkdir -p $TEMPDIR
        cd $TEMPDIR
        echo

        wget $URL > /dev/null
        unzip $ART_NAME.zip > /dev/null
        sudo cp -r $ART_NAME/* /var/www/html/
        echo

        # Restart HTTPD
        echo "##############################################"
        echo "Restarting HTTPD Service"
        echo "##############################################"
        systemctl restart $SVC
        echo

        # Clean Up
        echo "##############################################"
        echo "Removing Temporary Files"
        echo "##############################################"
        rm -rf $TEMPDIR
        echo

        sudo systemctl status $SVC
        ls /var/www/html
else
        #Set Variables for Ubuntu
        PACKAGE="apache2 wget unzip"
        SVC="apache2"

        echo "Running Setup on Ubuntu"
        # Installing Dependencies
        echo "##############################################"
        echo "Installing Packages"
        echo "##############################################"
        sudo apt update
        sudo apt install $PACKAGE -y > /dev/null
        echo

        # Start & Enable Service
        echo "##############################################"
        echo "Start & Enable HTTPD Service"
        echo "##############################################"
        sudo systemctl start $SVC
        sudo systemctl enable $SVC
        echo

        # Creating Temp Directory
        echo "##############################################"
        echo "Starting Deployment"
        echo "##############################################"
        mkdir -p $TEMPDIR
        cd $TEMPDIR
        echo

        wget $URL > /dev/null
        unzip $ART_NAME.zip > /dev/null
        sudo cp -r $ART_NAME/* /var/www/html/
        echo

        # Restart HTTPD
        echo "##############################################"
        echo "Restarting HTTPD Service"
        echo "##############################################"
        systemctl restart $SVC
        echo

        # Clean Up
        echo "##############################################"
        echo "Removing Temporary Files"
        echo "##############################################"
        rm -rf $TEMPDIR
        echo

        sudo systemctl status $SVC
        ls /var/www/html
fi