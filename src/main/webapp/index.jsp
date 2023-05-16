<%-- 
    Document   : index
    Created on : 4 Apr 2023, 11:01:03 am
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Courier Delivery System</title>
      <!-- Bootstrap CSS -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous">
      <style>
        body {
          display: flex;
          flex-direction: column;
          min-height: 100vh;
        }

        main {
          flex: 1;
        }

        .custom-navbar {
          background-color: rgb(230, 0, 0);
        }

        .custom-navbar .navbar-nav .nav-link,
        .custom-navbar .navbar-nav .nav-item {
          color: white;
        }

        .custom-navbar .navbar-nav .nav-link:focus,
        .custom-navbar .navbar-nav .nav-link:hover,
        .custom-navbar .navbar-nav .nav-item:focus,
        .custom-navbar .navbar-nav .nav-item:hover {
          color: white;
        }

        footer {
          margin-top: auto;
        }
      </style>
    </head>
    <body>
        <jsp:include page="header.html" flush="true" />
        
        
        <main class="flex-shrink-0">
            <header class="bg-light text-center py-5">
                <h1>Welcome to the Courier Delivery System</h1>
                <p class="lead">Efficient and reliable delivery services at your doorstep</p>
                <a class="btn btn-primary btn-lg" href="#" role="button">Get Started</a>
            </header>

            <section class="container my-5">
                <div class="row">
                    <div class="col-md-6">
                      <h2>Our Services</h2>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquet faucibus l
                      uctus. Curabitur volutpat metus non tellus luctus dapibus.</p>
                      <a class="btn btn-secondary" href="#" role="button">Learn More</a>
                    </div>
                    <div class="col-md-6">
                      <img src="delivery.jpg" alt="Delivery" class="img-fluid">
                    </div>
                </div>
            </section>

        </main>
        
        <jsp:include page="footer.html" flush="true" />
        
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" 
        integrity="sha384-"></script>
    </body>
</html>