# $Id: pod.t,v 1.3 2007/11/01 17:00:19 drhyde Exp $
use strict;
$^W = 1;

eval "use Test::Pod 1.00";
if($@) {
    print "1..0 # SKIP Test::Pod 1.00 required for testing POD";
} else {
    all_pod_files_ok();
}
