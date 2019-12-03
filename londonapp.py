"""Berkay Yildirim s5101002"""
""" This program is an app for London tourists to find information london and how to travel"""

from tkinter import *  # this imports everything from tkinter.
import tkinter as tk   # this imports tkinter as tk.
from PIL import Image, ImageTk  # this imports the pillow module to insert images to the GUI.
import requests  # this imports the requests module used for getting live data from the internet.

# These are variables that I created to store the fonts which I can then recall later in the program.
TITLE_FONT = ("times new roman bold", 30)
MEDIUM_FONT = ("Dax", 20)
SMALL_FONT = ("Dax", 10)
HOME_FONT = ("times new roman bold", 10,)

# This function formats the weather json into a string format which I can then display in the GUI.


def format_weather(weather):
    w_name = (weather["name"])
    w_desc = (weather["weather"][0]["description"])
    w_temp = (weather["main"]["temp"])

    return str(w_name) + "\n" + str(w_desc) + "\n" + str(w_temp) + " Celcius"

# This function requests the data in json form which I can then format.


def get_weather(city, weather_display):
    weather_key = "f1099c0d1d2873a0884ddc460d78a90f"
    weather_url = "https://api.openweathermap.org/data/2.5/weather"
    weather_params = {'APPID': weather_key, 'q': city, "units": "Metric"}
    weather_response = requests.get(weather_url, params=weather_params)
    weather = weather_response.json()
    weather_display["text"] = format_weather(weather)

# This function formats the news json into a string format which I can then display in the GUI.


def format_news(news):
    n_name = (news["articles"][0]["source"]["name"])
    n_title = (news["articles"][0]["title"])
    n_desc = (news["articles"][0]["url"])

    return str(n_name) + "\n" + str(n_title) + "\n" + str(n_desc)

# This function requests the data in json form which I can then format.


def get_news(news_display):
    news_contents = requests.get("https://newsapi.org/v2/top-headlines?country=gb&apiKey="
                                 "8f41bbede82f4683a27954822b723ecd")
    print(news_contents.text)
    news = news_contents.json()
    news_display["text"] = format_news(news)

# This function formats the transport json into a string format which I can then display in the GUI.


def format_transport(transport):
    t_date = (transport["date"])
    t_tod = (transport["time_of_day"])
    t_name = (transport["station_name"])
    t_destname = (transport["departures"]["all"][0]["destination_name"])
    t_mode = (transport["departures"]["all"][0]["mode"])
    t_depart = (transport["departures"]["all"][0]["expected_departure_time"])
    t_arrive = (transport["departures"]["all"][0]["expected_arrival_time"])

    return "Date:" + str(t_date) + "\n" + "Time of day:" + str(t_tod) + "\n" + "Station Name:" + str(t_name) + \
           "\n" + "Destination:" + str(t_destname) + "\n" + "Mode:" + str(t_mode) + \
           "\n" + "Departure time:" + str(t_depart) + "\n" + "Arrival time:" + str(t_arrive)


# This function requests the data in json form which I can then format.


def get_transport(transport_display):
    transport_contents = requests.get("https://transportapi.com/v3/uk/train/station/CLJ/live.json?app_id=f67eaa55&app"
                                      "_key=981d237ea142a522fe91fd44d636168c&darwin=false&train_status=passenger")
    transport = transport_contents.json()
    transport_display["text"] = format_transport(transport)

# This function formats the parking json into a string format which I can then display in the GUI.


def format_parking(parking):
    p_name = (parking[1]["name"])
    p_baycount = (parking[0]["bays"][0]["bayCount"])
    p_baytype = (parking[0]["bays"][0]["bayType"])
    p_free = (parking[0]["bays"][0]["free"])
    p_occupied = (parking[0]["bays"][0]["occupied"])
    return "Car Park:" + str(p_name) + "\n" + "BayCount:" + str(p_baycount) + "\n" + "BayType:" + str(p_baytype)\
           + "\n" + "Free Spaces:" + str(p_free) + "\n" + "Occupied:" + str(p_occupied)


# This function requests the data in json form which I can then format.

def get_parking(parking_display):
    parking_contents = requests.get("https://api.tfl.gov.uk/Occupancy/CarPark?app_id=bcc64636&app"
                                    "_key=1fe4b0f41493e459de9806419c809faa")
    parking = parking_contents.json()
    parking_display["text"] = format_parking(parking)

# This class is used to build the foundations of the GUI, it includes the window icon, window size and the window frames


class LondonApp(tk.Tk):

    def __init__(self, *args, **kwargs):

        tk.Tk.__init__(self, *args, **kwargs)
        container = tk.Frame(self)
        self.geometry("600x600")
        self.title("London Traveller")
        icon = PhotoImage(file="logo.png")
        self.tk.call("wm", "iconphoto", self._w, icon)

        container.pack(side="top", fill="both", expand=True)
        container.grid_rowconfigure(0, weight=1)
        container.grid_columnconfigure(0, weight=1)

        self.frames = {}

        for frm in (HomePage, Transport, ParkingInformation, LocalNews, Weather):
            frame = frm(container, self)
            self.frames[frm] = frame
            frame.grid(row=0, column=0, sticky="nsew")
            self.show_frame(HomePage)

    def show_frame(self, cont):
        frame = self.frames[cont]
        frame.tkraise()


# This is the homepage, it includes buttons which lead to other windows, logo and instructions on how to use the
#  buttons.

class HomePage(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.configure(background='lightblue')
        label_title = tk.Label(self, text="LONDON TRAVELLER", font=TITLE_FONT, bg='lightblue', fg='purple')
        label_title.place(x=10, y=30)

        load_logo = Image.open("logo.png")
        render_logo = ImageTk.PhotoImage(load_logo)
        logo = Label(self, image=render_logo, bg="lightblue")
        logo.image = render_logo
        logo.place(x=470, y=10)

        label_slogan = tk.Label(self, text="LONDON'S #1 TRAVELLING APP!", font=MEDIUM_FONT, bg='lightblue', fg='purple')
        label_slogan.place(x=20, y=85)

        transport_button = tk.Button(self, text="TRANSPORT", font=MEDIUM_FONT, height=3, width=12, bg="turquoise",
                                     fg="white", command=lambda: controller.show_frame(Transport))
        transport_button.place(x=80, y=150)
        weather_button = tk.Button(self, text="WEATHER", font=MEDIUM_FONT, height=3, width=12, bg="turquoise",
                                   fg="white", command=lambda: controller.show_frame(Weather))
        weather_button.place(x=80, y=300)
        local_news_button = tk.Button(self, text="LOCAL NEWS", font=MEDIUM_FONT, height=3, width=12, bg="turquoise",
                                      fg="white", command=lambda: controller.show_frame(LocalNews))
        local_news_button.place(x=330, y=300)
        tourist_info_button = tk.Button(self, text="PARKING\nINFORMATION", font=MEDIUM_FONT, height=3, width=12,
                                        bg="turquoise", fg="white", command=lambda: controller.show_frame
                                        (ParkingInformation))
        tourist_info_button.place(x=330, y=150)

        instruction_label = tk.Label(self, text="Click on the buttons above to find out information about it",
                                     font=SMALL_FONT, bg="lightblue", fg="purple")
        instruction_label.place(x=130, y=575)

# This is the transport page which is used to get live travel information on trains and includes a home button.


class Transport(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.configure(background='lightblue')

        transport_title = tk.Label(self, text="LONDON TRANSPORT", font=TITLE_FONT, bg='lightblue', fg='purple')
        transport_title.place(x=100, y=20)

        tbg_label = tk.Label(self, width=70, height=20, bg="turquoise")
        tbg_label.place(x=40, y=145)

        home_button1 = tk.Button(self, text="HOME", font=HOME_FONT, bg="turquoise", fg="white",
                                 command=lambda: controller.show_frame(HomePage))
        home_button1.place(x=5, y=5, height=50, width=50)

        tinstruction_label = tk.Label(self,  bg="Turquoise", fg="purple")
        tinstruction_label.place(x=45, y=160)

        transport_button = tk.Button(self, text="Get Transport Times ", fg="purple", height="3", width="20",
                                     command=lambda: get_transport(transport_display))
        transport_button.place(x=220, y=150)

        transport_display = tk.Label(self, bg="white", font=SMALL_FONT)
        transport_display.config(height=12, width=55)
        transport_display.place(x=70, y=230)


# This is the parking page which is used to get live parking information on parking spaces and includes a home button.

class ParkingInformation(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.configure(background='lightblue')

        parking_title = tk.Label(self, text="LONDON PARKING", font=TITLE_FONT, bg='lightblue', fg='purple')
        parking_title.place(x=100, y=20)

        pbg_label = tk.Label(self, width=70, height=20, bg="turquoise")
        pbg_label.place(x=40, y=145)

        home_button1 = tk.Button(self, text="HOME", font=HOME_FONT, bg="turquoise", fg="white",
                                 command=lambda: controller.show_frame(HomePage))
        home_button1.place(x=5, y=5, height=50, width=50)

        transport_button = tk.Button(self, text="Get parking info ", fg="purple", height="3", width="20",
                                     command=lambda: get_parking(parking_display))
        transport_button.place(x=220, y=150)

        parking_display = tk.Label(self, bg="white", font=SMALL_FONT)
        parking_display.config(height=12, width=55)
        parking_display.place(x=70, y=230)


# This is the weather page which is used to get live weather forecast information and includes a home button.

class Weather(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.configure(background='lightblue')

        weather_title = tk.Label(self, text="LONDON WEATHER", font=TITLE_FONT, bg='lightblue', fg='purple')
        weather_title.place(x=100, y=20)

        bg_label = tk.Label(self, width=70, height=20, bg="turquoise")
        bg_label.place(x=40, y=145)

        home_button3 = tk.Button(self, text="HOME", font=HOME_FONT, bg="turquoise", fg="white",
                                 command=lambda: controller.show_frame(HomePage))
        home_button3.place(x=5, y=5, height=50, width=50)

        instruction_label = tk.Label(self, text="Please enter 'London' and click 'Get Weather Forecast' to "
                                                "view the weather forecast", bg="Turquoise", fg="purple",
                                     font=SMALL_FONT)
        instruction_label.place(x=45, y=160)

        weather_entry = tk.Entry(self, bg="white")
        weather_entry.place(x=60, y=200, height=55, width=300)

        weather_button = tk.Button(self, text="Get Weather Forecast", fg="purple", height="3", width="20",
                                   command=lambda: get_weather(weather_entry.get(), weather_display))
        weather_button.place(x=370, y=200)

        weather_display = tk.Label(self, bg="white", font=MEDIUM_FONT)
        weather_display.config(height=4, width=28)
        weather_display.place(x=60, y=280)


# This is the news page which is used to get live local news and includes a home button.

class LocalNews(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.configure(background='lightblue')

        news_title = tk.Label(self, text="LONDON NEWS", font=TITLE_FONT, bg='lightblue', fg='purple')
        news_title.place(x=150, y=20)

        nbg_label = tk.Label(self, width=75, height=33, bg="turquoise")
        nbg_label.place(x=40, y=80)

        home_button4 = tk.Button(self, text="HOME", font=HOME_FONT, bg="turquoise", fg="white",
                                 command=lambda: controller.show_frame(HomePage))
        home_button4.place(x=5, y=5, height=50, width=50)

        news_button = tk.Button(self, text="Get News ", fg="purple", height="3", width="20",
                                command=lambda: (get_news(news_display)))
        news_button.place(x=240, y=100)

        news_display = tk.Label(self, bg="white", font=SMALL_FONT, )
        news_display.place(x=50, y=160)


# this mainloop is essential for the app to run, if it doesn't exist then the window will open and close instantly


app = LondonApp()
app.mainloop()
