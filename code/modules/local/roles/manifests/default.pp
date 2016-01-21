class roles::default {
    if $tag_beanstalk_id != '' {
        class { 'profiles::tomcat': }
    }
}
