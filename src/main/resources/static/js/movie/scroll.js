var page = 2;
var dataloading = false;



		
		$(window).scroll(function() {
			var scrollTop = $(this).scrollTop();
			var boxheight = $(this).height();
			var listheight = 0;	
			var genre = $("#select-search option:selected").val();
				console.log(genre)
			$(this).find('.list-box').each(function(index, box) {
				listheight += $(box).height();
			})
				
			if (!dataloading) {
				
				if($(window).scrollTop() == $(document).height() - $(window).height()){
					$.ajax({
						type:"GET",
						url:"/movie/ratelist.do",
						data:{"cp":page , "gr":genre},
						dataType:"json",
						beforeSend: function() {
							dataloading = true;
						},
						complete: function() {
							dataloading = false;
						},
						success:function(result){
							console.log("새 데이터 도착............")
							page++;
	
							$.each(result , function(index , list){
								
										
															
									var row =	"<div id='mid_wrap'>";
										row+=	"<ul class='movie'>";
										row+=	"	<li class='eachMovie'>";
										row+=	"		<div class='movie_poster'>";
										row+=	"			<div class='movie_wrap'>";
										row+=	"				<img class='movie_image' src='"+list.poster_uri+"'>";
										row+=	"			</div>";
										row+=	"		</div>";
										row+=	"		<div class='movie_name'>";
										row+=	"			<h3 class='movie_title'>";
										row+=	"				"+list.title+" ";
										row+=	"				<div class='modal_button'>";
										row+=	"					<button class='fas fa-ellipsis-v' id='modal_btn' data-toggle='modal' data-target='#exampleModal${vs.index}'></button>";
										row+=	"				</div>";
										row+=	"			</h3>";  
										row+=	"			<div class='movie_info'> "+list.prodyear+"-"+list.nation+" </div>";
										row+=	"			<div id='star-rating-zone'>";
										row+=	"				<div class='starRev'>";
										row+=	"					<span class='star starR1'>0.5</span> <span class='star starR2'>1</span>";
										row+=	"					<span class='star starR1'>1.5</span> <span class='star starR2'>2</span>";
										row+=	"					<span class='star starR1'>2.5</span> <span class='star starR2'>3</span>";
										row+=	"					<span class='star starR1'>3.5</span> <span class='star starR2'>4</span>";
										row+=	"					<span class='star starR1'>4.5</span> <span class='star starR2'>5</span>";
										row+=	"				</div>";
										row+=	"			</div>";
										row+=	"		</div>";
										row+=	"	</li>";
										row+=	"</ul>";
										row+=	"</div>";
										row+=	"	 <div class='modal fade' id='exampleModal${vs.index}' tabindex='-1' aria-labelledby='exampleModalLabel' aria-hidden='true' >";
										row+=	"<div class='modal-dialog'>";
										row+=	"	<div class='modal-content'>";
										row+=	"		<div class='modal-header'>";
										row+=	"			<h5 class='modal-title' id='exampleModalLabel'></h5>";
										row+=	"			<button type='button' class='close' data-dismiss='modal' aria-label='Close'>";
										row+=	"				<span aria-hidden='true'>&times;</span>";
										row+=	"			</button>";
										row+=	"		</div>";
										row+=	"		<div class='modal-body'>";
								
										row+=	"			<div class='movie_content'>";
										row+=	"				<div class='movie_poster'>";
								
										row+=	"					<div class='movie_wrap'>";
								
										row+=	"						<img class='movie_image' src='"+list.poster_uri+"' >";
								
										row+=	"					</div>";
										row+=	"				</div>";
										row+=	"				<div class=' css-1sondvb-ContentInfo e1pa47va1 '>";
										row+=	"					<div class='movie_name'>";
								
										row+=	"						<h3 class='movie_title'>";
										row+=	"							"+list.title+" ";
								
										row+=	"							<div class='modal_button'></div>";
										row+=	"						</h3>";
										row+=	"						<div class='movie_info'>"+list.prodyear+"-"+list.nation+"</div>";
										row+=	"					</div>";
										row+=	"				</div>";
										row+=	"			</div>";
										row+=	"			<div class='css-1k6r5nr-RowActionButtons e1pa47va5'>";
										row+=	"				<div aria-label='wished' role='button' class='css-1s4ktoa-RowActionButton-WishButton e1pa47va7'>";
										row+=	"					<img src='/img/movie/bookmark.svg' alt='wished'><span>보고싶어요</span>";
										row+=	"				</div>";
										row+=	"				<div aria-label='watching' role='button' class='css-9gb35z-RowActionButton-WatchingButton e1pa47va8'>";
										row+=	"					<img src='/img/movie/cloud.svg' alt='wished'><span>코멘트 작성하기</span>";
										row+=	"				</div>";
										row+=	"			</div>";
										row+=	"			<div class='modal-footer'>";
										row+=	"				<div aria-label='cancel' role='button' class='css-4w0dnp-ColumnActionButton-CancelButton e1pa47va11' data-dismiss='modal'>취소";
										row+=	" 				</div>";
										row+=	"			</div>";
										row+=	"		</div>";
										row+=	"	</div>";							
										row+=	"	</div>";
										row+=	"	</div>";





									$("#allcontents").append(row);
								});
							}
						});
					}
				}
			});







