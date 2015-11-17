<%@page contentType = "text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SELECT GAME</title>
		<script type="text/javascript" src="/5bject/jquery.do"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				var moFlag = false;
				var game1 = $("span#game1");
				var game2 = $("span#game2");
				var game3 = $("span#game3");

				var gameImg1 = document.createElement("img");
				
				gameImg1.setAttribute("src", "/5bject/image/game/game1.jpg");

				game1.append(gameImg1);
				
				var gameImg3 = document.createElement("img");
				
				gameImg3.setAttribute("src", "/5bject/image/game/game3.jpg");

				game3.append(gameImg3);
				
				game1.on("mouseover", function() {
					
				});

				game2.hover(gamePlate_mouseover, gamePlate_mouseout);

				gamePlate_mouseout();
				
				function gamePlate_mouseout() {
					if ( !moFlag ) {
						game2.empty();

						var gameSpan2 = document.createElement("span");

						gameSpan2.setAttribute("id", "gameSpan2");

						game2.append(gameSpan2);

						gameSpan2 = $("span#gameSpan2");

						var gameImg2 = document.createElement("img");

						gameImg2.setAttribute("src", "/5bject/image/game/game2.jpg");

						gameSpan2.append(gameImg2);
					
						game2.append(gameImg2);
						moFlag = true;
					}
				}
				
				function gamePlate_mouseover() {
					if ( moFlag ) {
						game2.empty();

						for ( var i = 1; i < 4; i++ ) {
							var span = document.createElement("span");
							span.setAttribute("id", "game2-" + i);
							span.setAttribute("class", "spanTr" + i);
							game2.append(span);
						}
	
						var childSpan = $("span#game2>span");
						childSpan.appendTo(game2);
	
						for ( var i = 0; i < 3; i++ ) {
							var aLink = document.createElement("a");
							aLink.setAttribute("onclick", "window.open('/5bject/game/testgame.do?difficulty="+(i+2)+"'); window.close();");
	
							var gameImg = document.createElement("img");
							gameImg.setAttribute("src", "/5bject/image/game/game2-" + (i + 1) + ".jpg");
							
							$(aLink).append(gameImg);
							childSpan.eq(i).append(aLink)
						}
						moFlag = false;
					}
				}
			});
		</script>
		<style type="text/css">
			.spanTr1 {
				position: absolute;
			}

			.spanTr2 {
				position: absolute;
				top: 104px;
			}

			.spanTr3 {
				position: relative;
			}
		</style>
	</head>
	<body>
		<div>
			<span id="game1"></span>
			<span id="game2"></span>
			<span id="game3"></span>
		</div>
	</body>
</html>