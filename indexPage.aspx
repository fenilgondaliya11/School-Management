<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/CS Files/indexPage.aspx.cs" Inherits="indexPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patel School In Ahemdabad</title>
    <link rel="icon" type="image/icon" href="images/icon.png" />

    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet' />
    <link rel="stylesheet" href="CSS/webstyle.css" />
    <link rel="stylesheet" href="CSS/webresponsive.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- HEADER BAR -->
        <header>
            <div class="logo">
                <h2>Patel School</h2>
            </div>
            <a class="menu__btn" id="toggleMenu">
                <div class="one"></div>
                <div class="two"></div>
                <div class="three"></div>
            </a>
        </header>

        <!-- NAVIGATION BAR -->
        <div class="menuLine"></div>
        <div class="navigation__container" id="MenuBTN">
            <a href="#home">Home</a>
            <a href="#about">About</a>
            <a href="#service">Service</a>
            <a href="#contactus">Contact Us</a>
            <a href="loginPage.aspx" id="menuSignin">Sign In</a>
        </div>


        <main>
            <!-- Home Container -->
            <div class="home__Container" id="home">
                <div class="content">
                    <h1>patel school</h1>
                    <p>Ahemdabad</p>
                    <div class="button">
                        <asp:LinkButton ID="signIn" runat="server" CssClass="btn" OnClick="signIn_Click">
                            <div class="text">Sign In</div>
                            <div class="icon"><i class='bx bx-log-in'></i></div>
                        </asp:LinkButton>
                    </div>
                </div>
                <div class="video">
                    <video autoplay="autoplay" loop="loop">
                        <source src="images/school.mp4" />
                    </video>
                </div>
            </div>


            <!-- About Container -->
            <div class="Container__Title" id="about">
                <div class="title__shadow">
                    <h1>About</h1>
                </div>
                <h2>About</h2>
            </div>
            <div class="about__container">
                <div class="about__image">
                    <img src="images/aboutImage.jpg" alt="School Image" />
                </div>
                <div class="about__content">
                    <h2 class="about__title">Patel School</h2>
                    <p class="about__description">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Officia labore laboriosam veniam, iusto, facilis, sed error adipisci voluptas sint a aliquam! Pariatur obcaecati magnam modi consequatur? Non perferendis ut earum beatae eligendi sed, ipsum culpa veniam repudiandae odio ipsam vel quia totam qui ex in eius quo animi necessitatibus sit dolorum laboriosam illum nobis. Adipisci doloremque ut, nemo temporibus voluptate eum maiores odio debitis officiis eaque cumque aliquam dolores provident culpa expedita sint alias commodi corrupti id accusantium dolorem dolorum molestias! Consequatur et error recusandae debitis, provident incidunt qui ducimus ipsum earum, laboriosam quis quidem, non modi rerum consequuntur? Molestias.</p>
                    <button class="btn">
                        <div class="text">Read More</div>
                        <div class="icon"><i class='bx bx-right-arrow-alt'></i></div>
                    </button>
                </div>
            </div>


            <!-- Services Container -->
            <div class="Container__Title" id="service">
                <div class="title__shadow">
                    <h1>Service</h1>
                </div>
                <h2>Service</h2>
            </div>
            <div class="service__container">

                <!-- Computer Lab -->
                <div class="box">
                    <div class="box__content">
                        <h2>Computer Lab</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque aut ipsam corporis non blanditiis repudiandae ratione? Consectetur quisquam fugiat ducimus sint consequuntur laboriosam totam reprehenderit ad nam expedita deserunt veniam earum nostrum ea, voluptas architecto doloribus a illo obcaecati doloremque. Perferendis minus ut cum illo sit quasi nihil rerum incidunt!</p>
                        <button class="btn">
                            <div class="text">Read More</div>
                            <div class="icon"><i class='bx bx-right-arrow-alt'></i></div>
                        </button>
                    </div>
                    <div class="box__image">
                        <img src="images/computerLab.jpg" alt="Computer Lab Image" />
                    </div>
                </div>

                <!-- Science Lab -->
                <div class="box">
                    <div class="box__image">
                        <img src="images/scienceLab.jpg" alt="Science Lab Image" />
                    </div>
                    <div class="box__content">
                        <h2>Science Lab</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque aut ipsam corporis non blanditiis repudiandae ratione? Consectetur quisquam fugiat ducimus sint consequuntur laboriosam totam reprehenderit ad nam expedita deserunt veniam earum nostrum ea, voluptas architecto doloribus a illo obcaecati doloremque. Perferendis minus ut cum illo sit quasi nihil rerum incidunt!</p>
                        <button class="btn">
                            <div class="text">Read More</div>
                            <div class="icon"><i class='bx bx-right-arrow-alt'></i></div>
                        </button>
                    </div>
                </div>

                <!-- Library Lab -->
                <div class="box">
                    <div class="box__content">
                        <h2>Library Lab</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque aut ipsam corporis non blanditiis repudiandae ratione? Consectetur quisquam fugiat ducimus sint consequuntur laboriosam totam reprehenderit ad nam expedita deserunt veniam earum nostrum ea, voluptas architecto doloribus a illo obcaecati doloremque. Perferendis minus ut cum illo sit quasi nihil rerum incidunt!</p>
                        <button class="btn">
                            <div class="text">Read More</div>
                            <div class="icon"><i class='bx bx-right-arrow-alt'></i></div>
                        </button>
                    </div>
                    <div class="box__image">
                        <img src="images/library.jpg" alt="Library Lab Image" />
                    </div>
                </div>

                <!-- Internet Lab -->
                <div class="box">
                    <div class="box__image">
                        <img src="images/internetLab.jpg" alt="Internet Lab Image" />
                    </div>
                    <div class="box__content">
                        <h2>Internet Lab</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque aut ipsam corporis non blanditiis repudiandae ratione? Consectetur quisquam fugiat ducimus sint consequuntur laboriosam totam reprehenderit ad nam expedita deserunt veniam earum nostrum ea, voluptas architecto doloribus a illo obcaecati doloremque. Perferendis minus ut cum illo sit quasi nihil rerum incidunt!</p>
                        <button class="btn">
                            <div class="text">Read More</div>
                            <div class="icon"><i class='bx bx-right-arrow-alt'></i></div>
                        </button>
                    </div>
                </div>

            </div>


            <!-- Contact Us Container -->
            <div class="Container__Title" id="contactus">
                <div class="title__shadow">
                    <h1>Contact Us</h1>
                </div>
                <h2>Contact Us</h2>
            </div>
            <div class="contactus__container">
                <div class="social__container">
                    <div class="social__box">
                        <i class='bx bx-phone phone'></i>
                        <h3>Phone</h3>
                    </div>
                    <div class="social__box">
                        <i class='bx bxl-gmail email'></i>
                        <h3>Email</h3>
                    </div>
                    <div class="social__box">
                        <i class='bx bx-current-location address'></i>
                        <h3>Address</h3>
                    </div>
                    <div class="social__box">
                        <i class='bx bxl-meta meta'></i>
                        <h3>Facebook</h3>
                    </div>
                    <div class="social__box">
                        <i class='bx bxl-instagram instagram'></i>
                        <h3>Instagram</h3>
                    </div>
                    <div class="social__box">
                        <i class='bx bxl-whatsapp whatshapp'></i>
                        <h3>Whatsh App</h3>
                    </div>

                </div>

                <div class="contactus__box">
                    <div class="contactus__image">
                        <video autoplay="autoplay" loop="loop">
                            <source src="images/contactUs.mp4" />
                        </video>
                    </div>
                    <div class="contactus__form">
                        <div class="form">
                            <div class="input__box w100">
                                <div class="w50">
                                    <label for="firstName">First Name</label>
                                    <input type="text" placeholder="First Name" id="firstName" required="required" />
                                </div>
                                <div class="w50">
                                    <label for="firstName">Last Name</label>
                                    <input type="text" placeholder="Last Name" id="lastName" required="required" />
                                </div>
                            </div>
                            <div class="input__box">
                                <label for="emailid">Email ID</label>
                                <input type="email" placeholder="Email ID" id="emailid" required="required" />
                            </div>
                            <div class="input__box">
                                <label for="mobileno">Mobile No</label>
                                <input type="number" placeholder="Mobile Number" id="mobileno" min="0" />
                            </div>
                            <div class="input__box">
                                <label for="message">Message</label>
                                <textarea placeholder="Message" id="message" required="required"></textarea>
                            </div>
                            <button class="btn">
                                <div class="text">
                                    <p>Send</p>
                                </div>
                                <div class="icon">
                                    <i class='bx bx-send'></i>
                                </div>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </main>

        <footer>
            <p>Copyright &copy; 2023 patel school design by || Fenil Gondaliya || <a href="#">terms or condition</a></p>
        </footer>


        <button class="topBtn btn" id="scrollTop">
            <div class="text">Scroll Top</div>
            <div class="icon"><i class='bx bx-up-arrow-alt'></i></div>
        </button>





  

        <script src="JS/jquery.min.js"></script>
        <script src="JS/main.js"></script>
    </form>
</body>
</html>
