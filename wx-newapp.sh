echo
echo Creating a new wxPerl Application Shell...
echo
cat wx-app-top-template > wx-newapp.pl
cat wx-titletext-template >> wx-newapp.pl
cat wx-button-template >> wx-newapp.pl
cat wx-dataentrybox-template >> wx-newapp.pl
cat wx-messagebox-template >> wx-newapp.pl
cat wx-radiobox-template >> wx-newapp.pl
cat wx-sizer-template >> wx-newapp.pl
cat wx-event-template >> wx-newapp.pl
cat wx-timer-template >> wx-newapp.pl
cat wx-app-bottom-template >> wx-newapp.pl
echo Done...
echo
cat wx-newapp.pl

