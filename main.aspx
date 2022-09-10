<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"/>
<style>
.section-team {
	font-family: "Poppins", sans-serif;
	padding: 80px 0;
}

.section-team .header-section {
	margin-bottom: 50px;
}

.section-team .header-section .small-title {
    margin-bottom: 25px;
	font-size: 16px;
    font-weight: 500;
    color: #3e64ff;
}

.section-team .header-section .title {
    font-weight: 700;
    font-size: 45px;
}

.section-team .single-person {
	margin-top: 30px;
	padding: 30px;
	background-color: lightgray;
	border-radius: 5px;
}

.section-team .single-person:hover {
	background: linear-gradient(to right, #d33b33, #d62121);
}

.section-team .single-person .person-image {
    position: relative;
    margin-bottom: 50px;
    border-radius: 50%;
    border: 4px dashed transparent;
    transition: padding .3s;
}

.section-team .single-person:hover .person-image {
	padding: 12px;
    border: 4px dashed #fff;
}

.section-team .single-person .person-image img {
	width: 100%;
    border-radius: 50%;
}

.section-team .single-person .person-image .icon {
	position: absolute;
    bottom: 0;
    left: 50%;
    transform: translate(-50%,50%);
    display: inline-block;
    width: 60px;
    height: 60px;
    line-height: 60px;
    text-align: center;
    background: linear-gradient(to right, #d33b33, #ff3333);
    color: #fff;
    border-radius: 50%;
    font-size: 24px;
}

.section-team .single-person:hover .person-image .icon {
	background: none;
	background-color: #fff;
	color: #d33b33;
}

.section-team .single-person .person-info .full-name {
	margin-bottom: 10px;
	font-size: 27px;
    font-weight: 700;
}

.section-team .single-person .person-info .speciality {
    text-transform: uppercase;
    font-size: 14px;
    color: #d33b33;
}

.section-team .single-person:hover .full-name,
.section-team .single-person:hover .speciality {
	color: #fff;
}
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Image Slider Part -->
  <div id="slides" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#slides" data-slide-to="0" class="active"></li>
    <li data-target="#slides" data-slide-to="1"></li>
    <li data-target="#slides" data-slide-to="2"></li>
    <li data-target="#slides" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="images/slide1.jpg" alt="First slide" >
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/slide2.jpg" alt="Second slide" >
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/slide3.jpg" alt="Third slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="images/slide4.jpg" alt="Fourth slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#slides" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#slides" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<br />
 <!----- Books  -->
<a name="books">
    <div class="container">
        <div class="bookHead">
           <div style="float: right;margin:5px;"> 
             <h5><b><i class="fa fa-book" aria-hidden="true"></i> <asp:DropDownList ID="dropCategory" runat="server" BackColor="#f2f2f2" ForeColor="#D33B33" Font-Bold="true" AutoPostBack="true" OnSelectedIndexChanged="dropCategory_SelectedIndexChanged"></asp:DropDownList></b></h5>
           </div>
        <h5><b><u>Recently Added:</u></b></h5>
            </div><br /><br />
        <div class="row">
            <asp:Repeater ID="RepeatBooks" runat="server">
                <ItemTemplate>      
                    <div class="col-md-3 col-sm-6 col-xs-12 product-grid">
				<div class="image">
					<a href="BookDetails.aspx?bid=<%#Eval("BID") %>">
						<img src="images/Books/<%#Eval("BName") %>/<%#Eval("BImage") %><%#Eval("BExtension") %>" alt="<%#Eval("BName") %>" class="img-thumbnail">
						<div class="overly">
							<div class="detail">View Details</div>
						</div>
					</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div class="bookName"><a href="BookDetails.aspx?bid=<%#Eval("BID") %>"><%#Eval("BName") %></a></div>
                <div class="bookAuthor"><%#Eval("BAuthor") %></div>
				<div class="bookPrice"><span class="bookOrgPrice"><%#Eval("BPrice") %></span> <%#Eval("BSPrice") %><span class="bookDisc"> (Rs.<%#Eval("BDisc") %> Off)</span></div>
				<br /><a class="btn btn-primary" href="BookDetails.aspx?bid=<%#Eval("BID") %>" role="button">View Book</a>
                </div>
              </ItemTemplate>
          </asp:Repeater>
          </div>
             </div>
</a>
<hr style="align-items:center;margin-top:30px;" class="bg-secondary" />    
 <!----------  Our Author Instagram ------------>
<section class="section-team">
		<div class="container">
			<!-- Start Header Section -->
			<div class="row justify-content-center text-center">
				<div class="col-md-8 col-lg-6">
					<div class="header-section">
						<h2 class="title">Let's meet with Our Featured Authors on OBS</h2>
					</div>
				</div>
			</div>
			<!-- / End Header Section -->
			<div class="row">
				<!-- Start Single Person -->
				<div class="col-sm-6 col-lg-4 col-xl-3">
					<div class="single-person">
						<div class="person-image">
                           <a href="https://www.instagram.com/jkrowling_official/?hl=en">
							  <img src="images/jk.jpg" alt="">
							    <span class="icon">
								 <i class="fa fa-instagram"></i>
							     </span>
                            </a>
						</div>
						<div class="person-info">
							<h3 class="full-name">J.K Rowling</h3>
                            <span class="speciality">Fantasy, Fiction</span>
						</div>
					</div>
				</div>
				<!-- / End Single Person -->
				<!-- Start Single Person -->
				<div class="col-sm-6 col-lg-4 col-xl-3">
					<div class="single-person">
						<div class="person-image">
                          <a href="https://www.instagram.com/official.kishi/?hl=en">
							<img src="images/masashi-kishimoto.jpg" alt="">
							<span class="icon">
								<i class="fa fa-instagram" aria-hidden="true"></i>
							</span>
                          </a>
						</div>
						<div class="person-info">
							<h3 class="full-name">M. Kishimoto</h3>
                            <span class="speciality">Manga Comics</span>
						</div>
					</div>
				</div>
				<!-- / End Single Person -->
				<!-- Start Single Person -->
				<div class="col-sm-6 col-lg-4 col-xl-3">
					<div class="single-person">
						<div class="person-image">	
                           <a href="https://www.instagram.com/ssnyder1835/?hl=en">
                          <img src="images/scott.jpg" alt="">
							<span class="icon">
								<i class="fa fa-instagram" aria-hidden="true"></i>
							</span>
                            </a>
						</div>
						<div class="person-info">
							<h3 class="full-name">Scott Snyder</h3>
                            <span class="speciality">Superhero, Horror</span>
						</div>
					</div>
				</div>
				<!-- / End Single Person -->
				<!-- Start Single Person -->
				<div class="col-sm-6 col-lg-4 col-xl-3">
					<div class="single-person">
						<div class="person-image">
                          <a href="https://www.instagram.com/chetanbhagat/?hl=en">
							<img src="images/ChetanBhagat.jpg" alt="">
							<span class="icon">
								<i class="fa fa-instagram" aria-hidden="true"></i>
							</span>
                           </a>
						</div>
						<div class="person-info">
							<h3 class="full-name">Chetan Bhagat</h3>
                            <span class="speciality">Romance, Thriller</span>
						</div>
					</div>
				</div>
				<!-- / End Single Person -->
			</div>
		</div>
	</section>


<!----- Middle Contents ---->
<a name="services">
    <div class="middle">
       <hr style="align-items:center;margin-top:20px;" class="bg-secondary" />
       <h1 style="text-align:center" class="title">Our Services</h1>
        <div class="container">
        <div class="row">
            <div class="col-lg-4 text-center">
                <img src="../images/circle1.jpg" class="img-circle" width="140" height="140" />
                <h3>What is OBS Books? Why use it?</h3>
                <p>OBS Books is all about discovery. We’ve applied over twenty years of experience as a customer-focused, online retailer to build a store that integrates the benefits of offline and online shopping and spurs discovery of great books, Amazon devices and customer favorites from obs.com.At Online Bookstore we are working towards bringing our retail experience to the web and we strive to uphold this prestige by serving our customers better.                <p><a class="btn btn-secondary" href="#" role="button">View &raquo;</a></p>
            </div>
             <div class="col-lg-4 text-center">
                <img src="../images/circle2.jpg" class="img-circle" width="140" height="140" />
                <h3>Who Selects the Book?</h3>
                <p>We have a team of curators that study the information behind what people are reading, how they are reading and what they are loving, to bring forward a highly-curated selection of books that customers will love. They use Amazon.com customer ratings, reviews, pre-orders, sales, popularity on Goodreads, Kindle reading behavior and their own expertise to inform their selections. As an extension of Amazon.com, we have incorporated information from the millions of readers from OBS.com into our stores to help OBS Books customers discover books that are loved by fellow readers across the country.</p>
                <p><a class="btn btn-secondary" href="#" role="button">View &raquo;</a></p>
            </div>
             <div class="col-lg-4 text-center">
                <img src="../images/circle3.jpg" class="img-circle" width="140" height="140" />
                <h3>How is it different to Amazon Bookstore or Powells?</h3>
                <p>First and foremost, we’re a bookstore! All the books in our stores are bestsellers, new releases, or rated 4 stars and above by amazon.com customers. To help you discover books you’ll love, our curators have developed familiar product groupings like you would see online that highlight what customers are reading, how they’re reading, and what they’re loving. Examples of these include: a feature that showcases well-known bestsellers alongside lesser-known titles that would appeal to the same reader; and, “Highly Quotable” a feature that uses aggregated Kindle reading behavior to help customers find books that are especially memorable or quote-worthy.</p><p><a class="btn btn-secondary" href="#" role="button">View &raquo;</a></p>
            </div>
            </div>
            </div>
        </div>
 </a>

</asp:Content>

