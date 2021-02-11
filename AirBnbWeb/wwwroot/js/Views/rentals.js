var RentalEndpointBase = "http://localhost:4899/api/rental"
var GetAllRentalEndpoint = "/getallrentals"
var GetRentalByIdEndpoint = "/getrental/"


function GetAllRentals()
{
    $.ajax({
        method: "GET",
        url: RentalEndpointBase + GetAllRentalEndpoint
    }).done(function (data) {
        console.log(data);
        $(".pb-3").append(
            "<div class='columns' id='rentals'></div>");
        for (var i = 0; i < data.length; i++) {
            $("#rentals").append(
                `<div class='column'>
                    <div class='card' onclick='LoadRental(id)' id='` + data[i].id + `'>
                        <div class='card-image'>
                            <figure class='card-image is-4by3'>
                                <img src='https://www.finardproperties.com/sites/default/files/blogpost-1.jpg' alt='placeholder image'>
                            </figure>
                        </div>
                        <div class='card-content'>
                            <h3>Title:` + data[i].title + `</h3>
                            ` + `<p>Bedrooms:` + data[i].bedrooms + `</p>
                            <p>Bathrooms:` + data[i].bathrooms + `</p>
                            <p><strong>` + data[i].rentalFee + `</strong></p>
                        </div>
                    </div>
                </div>`);
        }
    });
}

function LoadRental(res)
{    
    $(".pb-3").empty();
    $.ajax({
        method: "GET",
        url: RentalEndpointBase + GetRentalByIdEndpoint + res
    }).done(function (data) {
        console.log(data);
        $(".pb-3").append(
            `<section class='hero'> <div class='hero-body'> <div class='container is-fluid'> <h1>` + data.title + `</h1> </div> </div> </section>
             <section class='section'>
                <div class='container is-fluid'>
                    <div class='columns'>
                        <div class='column is-three-quarters'>
                            <figure class='image is-4by3'>
                                <img src='https://www.finardproperties.com/sites/default/files/blogpost-1.jpg' alt='placeholder image'>
                            </figure>
                        </div>
                        <div class='column'>
                            <div class='content'>
                                <p>Description:` + data.description + `</p>
                                <p>bedrooms:` + data.bedrooms + `</p>
                                <p>bathrooms:` + data.bathrooms + `</p>
                                <p><strong>` + data.rentalFee + `</strong></p>
                            </div>
                        </div>
                        <div class='column is-full'>
                            
                        </div>
                    </div>
                </div>
            </section>`);

    });
}


$(document).ready()
{
}