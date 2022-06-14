
     function check1(){
        var ms = document.getElementById('mission1');
        var cbtn = document.getElementById('clearbtn1');
        ms.style.color = '#C0C0C0'; /* 文字の色を薄くする */
        ms.style.textDecoration = "line-through"; /* 取り消し線追加 */
        cbtn.value = "済";
        cbtn.disabled = 'true';
    }
    function check2(){
        var ms = document.getElementById('mission2');
        var cbtn = document.getElementById('clearbtn2');
        ms.style.color = '#C0C0C0';
        ms.style.textDecoration = "line-through";
        cbtn.value = "済";
        cbtn.disabled = 'true';
    }
    function check3(){
        var ms = document.getElementById('mission3');
        var cbtn = document.getElementById('clearbtn3');
        ms.style.color = '#C0C0C0';
        ms.style.textDecoration = "line-through";
        cbtn.value = "済";
        cbtn.disabled = 'true';
    }
