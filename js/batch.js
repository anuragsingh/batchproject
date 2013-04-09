$(document).ready(function() {
    $('#batchselector').change(function() {
        var url = "http://localhost/batchproject/report.php?batchno="+$(this).val();    
        $(location).attr('href',url);
    });
});