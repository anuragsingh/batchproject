$(document).ready(function() {
    $('#batchselector').change(function() {
        var pathname = window.location.pathname;
        //var url = "http://localhost/batchproject/report.php?batchno="+$(this).val();
        var url = pathname+"?batchno="+$(this).val();;
        $(location).attr('href',url);
    });
});