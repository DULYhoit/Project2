/*$("#delete").click(function(){
       $('input').tagsinput('removeAll');
}); //x 클릭시 삭제*/

   $(function(){
     $('input').on('input',function(){
         if($("input").val()=='')
         $(".fas fa-check").attr("disabled",true);
         else
         $(".fas fa-check").attr("disabled",false);
     });
 })