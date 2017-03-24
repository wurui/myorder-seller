define([], function () {
    var appendParam = function(url,param){
        var arr=[];
        for(var k in param){
            arr.push(k+'='+param[k]);
        }
        return url + (url.indexOf('?')>-1?'&':'?') + arr.join('&')
    }
    return {

        init: function ($mod) {
            $mod.on('click', '.J_op', function (e) {
                var tar = e.target;
                var status = tar.getAttribute('data-status'),
                    param={
                        tradeno:tar.getAttribute('data-tradeno')
                    }
                switch (status - 0) {
                    case 1://去发货
                        location.href = appendParam($mod.attr('data-sendurl'),param)
                        break
                }
            })
        }
    }
})
