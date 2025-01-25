<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="musicplayer.aspx.cs" Inherits="MusicPlayerApp.musicplayer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Music Player</title>
    <!-- Link to the styles for login and music player -->
    <link rel="stylesheet" href="styles/login.css" />
    <link rel="stylesheet" href="styles/musicplayer.css" />
    <script src="https://kit.fontawesome.com/2be8db49a1.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Login Panel -->
        <asp:Panel ID="LoginPanel" runat="server">
            <h1>Login</h1>
            <div>
                <label for="username">Username</label>
                <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Username"></asp:TextBox>
            </div>
            <div>
                <label for="password">Password</label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            </div>
            <div class="checkbox-container">
                <input class="checkbox" type="checkbox" 
                    onchange="document.getElementById('<%= TextBox2.ClientID %>').type = this.checked ? 'text' : 'password'" />
                <span>Show Password</span>
            </div>
            <div>
                <asp:Button ID="BtnLogin" runat="server" Text="Login" CssClass="button" OnClick="BtnLogin_Click" />
                <asp:Button ID="BtnCancel" runat="server" Text="Cancel" CssClass="button" OnClick="BtnCancel_Click" />
            </div>
        </asp:Panel>

        <!-- Music Player Panel -->
        <asp:Panel ID="MusicPlayerPanel" runat="server" Visible="false">
            <div class="container">
                <div class="music-player">
                    <nav>
                        <div class="circle">
                            <i class="fa-solid fa-angle-left"></i>
                        </div>
                        <div class="circle">
                            <i class="fa-solid fa-bars"></i>
                        </div>
                    </nav>
                    <img src="media/thumbnail.png" class="song-img" />
                    <h1>Despacito</h1>
                    <p>Luis Fonsi Ft. Puerto Rican</p>

                    <!-- Audio Element -->
                    <audio id="song">
                        <source src="media/Despacito.mp3" type="audio/mpeg" />
                        Your browser does not support the audio element.
                    </audio>
                    <input type="range" value="0" id="progress" />

                    <div class="controls">
                        <!-- Backward Button -->
                        <div><i class="fa-solid fa-backward" onclick="rewind()"></i></div>
                        <!-- Play/Pause Button -->
                        <div><i id="ctrlIcon" onclick="playPause()" class="fa-solid fa-play"></i></div>
                        <!-- Forward Button -->
                        <div><i class="fa-solid fa-forward" onclick="forward()"></i></div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </form>

    <!-- JavaScript for Music Player -->
    <script>
        const progress = document.getElementById("progress");
        const song = document.getElementById("song");
        const ctrlIcon = document.getElementById("ctrlIcon");

        // Ensure the song does not play automatically when the page loads
        song.pause();

        // Function to toggle play/pause
        function playPause() {
            if (song.paused) {
                song.play();
                ctrlIcon.classList.remove("fa-play");
                ctrlIcon.classList.add("fa-pause");
            } else {
                song.pause();
                ctrlIcon.classList.add("fa-play");
                ctrlIcon.classList.remove("fa-pause");
            }
        }

        // Function to rewind the song by 3 seconds
        function rewind() {
            song.currentTime = Math.max(0, song.currentTime - 3);
        }

        // Function to forward the song by 3 seconds
        function forward() {
            song.currentTime = Math.min(song.duration, song.currentTime + 3);
        }

        // Update the progress bar as the song plays
        song.ontimeupdate = function () {
            progress.value = song.currentTime;
        };

        // Seek when the progress bar is adjusted
        progress.onchange = function () {
            song.currentTime = progress.value;
        };

        // Load the metadata when the audio is ready
        song.onloadedmetadata = function () {
            progress.max = song.duration;
            progress.value = song.currentTime;
        };
    </script>
</body>
</html>
