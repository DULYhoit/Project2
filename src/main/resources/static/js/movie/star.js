            // 별점 
            $('.star').on('click', function () {
              // console.log($(this).text());

              if ($(this).hasClass('on')) {
                  $(this).parent().children().removeClass('on');
                  memberCommentDiv.style.display = "none";
                  var starMessage = document.getElementById("star-message");

                  starMessage.innerText = "평가하기";

              } else {
                  $(this).addClass('on').prevAll('span').addClass('on');
                  memberCommentDiv.style.display = "block";
                  var starMessage = document.getElementById("star-message");
                  var ratedStar = $(this).html();

                  var starCount = $(this).prevAll().length/2 + 0.5; 
                  console.log(starCount);
                  ratedStar = starCount;
                  
                  
                  console.log(ratedStar);

                  switch (ratedStar) {
                      case 0.5:
                          starMessage.innerText = "최악이에요";
                          break;
                      case 1:
                          starMessage.innerText = "싫어요";
                          break;
                      case 1.5:
                          starMessage.innerText = "재미없어요";
                          break;
                      case 2:
                          starMessage.innerText = "별로예요";
                          break;
                      case 2.5:
                          starMessage.innerText = "부족해요";
                          break;
                      case 3:
                          starMessage.innerText = "보통이에요";
                          break;
                      case 3.5:
                          starMessage.innerText = "볼만해요";
                          break;
                      case 4:
                          starMessage.innerText = "재미있어요";
                          break;
                      case 4.5:
                          starMessage.innerText = "훌륭해요!";
                          break;
                      case 5:
                          starMessage.innerText = "최고예요!";
                          break;
                  }
              }
          })