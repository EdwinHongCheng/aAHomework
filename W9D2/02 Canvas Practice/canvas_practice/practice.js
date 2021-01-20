document.addEventListener("DOMContentLoaded", function(){

    // Phase 1

    const canvasElement = document.getElementById("mycanvas");

    canvasElement.width = 500;
    canvasElement.height = 500;

    const ctx = canvasElement.getContext("2d");


    // Phase 2

    ctx.fillStyle = "green";

    ctx.fillRect(0, 0, 500, 500);


    // Phase 3

    ctx.beginPath();
    ctx.arc(100, 100, 20, 0, 2 * Math.PI, true);
    ctx.strokeStyle = "yellow";
    ctx.lineWidth = 5;
    ctx.stroke();

    ctx.fillStyle = "gray";
    ctx.fill();


    // Phase 4

    ctx.beginPath();
    ctx.arc(50, 50, 20, 0, 2 * Math.PI, true);
    ctx.strokeStyle = "orange";
    ctx.lineWidth = 5;
    ctx.stroke();

    ctx.fillStyle = "blue";
    ctx.fill();

});
