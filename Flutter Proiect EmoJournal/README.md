# emojournal

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

EmoJournal is a Flutter application designed to help users express their emotions and manage their emoji preferences. The application offers the following functionalities:

Home Page:

Displays the user's selected emoji in a central container.
Provides buttons for adding an emoji and accessing the favorite emoji page.
Includes a top bar with navigation options to the calendar and settings pages.
Emoji of the Day:

Presents the emoji of the day in an animated widget with the option to add it to the favorites list.
Favorite Page:

Allows users to view and manage favorite emojis.
Utilizes an interactive list to delete emojis from the favorites list.
Calendar:

Displays an interactive calendar.
Settings:

Enables users to choose between Light, Dark, and Purple theme modes.
Bottom Navigation Bar:

Provides buttons for quick navigation between emoji and list pages.
State Management:

Uses Provider and ChangeNotifier to efficiently manage the application state and the list of favorite emojis.
EmoJournal thus provides a simple and interactive experience for recording daily emotions, customizing emoji preferences, and exploring their history in an accessible and enjoyable manner.

Structure of the Flutter EmoJournal Application:

The structure of the EmoJournal application is organized into multiple modules and widgets to ensure efficient code management and clear separation of functionalities. This modular structure allows for easy development, extensibility, and efficient maintenance of the EmoJournal application. Each component has a well-defined role and can be adapted or extended independently.

The structure looks like this:

data
	emoji_constants.dart
	emoji_data.dart
	emoji_picker_dialog.dart
	emojis.dart
	favorite_item.dart
	theme_provider.dart
pages
	add_emoji_page.dart
	calendar_page.dart
	emoticon_page.dart
	favorites_page.dart
	home_page.dart
	list_page.dart
	settings_page.dart
widget
widgets_add_emoji_page
	custom_emoji_button.dart
widgets_calendar_page
	calendar_app_bar.dart
	interactive_calendar.dart
widgets_emoticon_page
	emoticon_of_the_day_description.dart
	emoticon_of_the_day_display.dart
	widgets_emoticon_page.dart
widgets_favorites_page
	favorite_list_item.dart
	favorite_page_body.dart
	widgets_favorites_page.dart
widgets_home_page
	action_row.dart
	bottom_navigation.dart
	selected_emoji_display.dart
	top_bar.dart
widgets_list_page
	change_notifier_provider.dart
	emoji_item.dart
	favorites_notifier.dart
widget_settings_page
	settings_widgets.dart
	main.dart


Explanations for each file individually:

emoji_constants.dart class provides constants for various emojis used in the application, offering a centralized way to manage them. These constants are used throughout the application to provide a consistent and intuitive look, improving the understanding of actions and navigation.

emoji_data.dart class is a data manager responsible for handling emoji-related information within the application. It ensures an efficient mechanism for managing emoji data and provides a centralized source of information. By implementing ChangeNotifier, it automatically notifies widgets dependent on this data when it changes, facilitating real-time interface updates.

emoji_picker_dialog.dart file defines a dialog for selecting emojis within the EmoJournal application. It provides an interactive and aesthetic dialog for emoji selection, enhancing user interaction with these specific elements.

emoji.dart file contains the definition of the Emoji class and a list of emojis used in the EmoJournal application. It defines and organizes the collection of emojis used in the application, making it easy to access information such as the symbol, name, and Unicode code for each emoji. Thus, the classification and management of emojis are centralized in a coherent structure, easy to maintain and use within the application.

favorite_item.dart file contains the definition of the FavoriteItem class. This class models a favorite item in the EmoJournal application and encapsulates essential information, such as the favorite emoji and its associated date. Using this class simplifies the management and storage of favorite items, providing a cohesive and user-friendly structure within the application.

theme_provider.dart file contains the definition of the ThemeProvider class, which manages the theme mode for the application. This class offers a centralized mechanism for handling the theme mode within the EmoJournal application. Through the ThemeModeType enumeration and the toggleTheme method, users can dynamically switch themes, and widgets depending on this configuration will be automatically updated.

add_emoji_page.dart file contains the definition of the AddEmojiPage class, representing the emoji addition page in the EmoJournal application. This widget allows users to view and change emojis interactively, providing an intuitive experience in the process of adding emojis to the EmoJournal application.

calendar_page.dart file contains the definition of the CalendarPage class, representing the calendar page in the EmoJournal application. This file represents the calendar page and encapsulates specific functionalities of this page, such as displaying the interactive calendar and managing the overall appearance of the calendar page within the EmoJournal application.

emoticon_page.dart file contains the definition of the EmoticonOfTheDayPage class, representing the "Emoticon of the Day" page in the EmoJournal application. This file represents and manages aspects related to the "Emoticon of the Day" in the EmoJournal application, providing an interactive experience and periodically updating the emoticon of the day.

favorites_page.dart file contains the definition of the FavoritesPage class, representing the "Favorites" page in the EmoJournal application. This file contributes to the overall functionality of the EmoJournal application, providing the user with easy access to their list of favorite items and ensuring a consistent and enjoyable experience on the page.

home_page.dart file contains the definition of the HomePage class, representing the main page of the EmoJournal application. This file contributes to the core functionality of the application, allowing users to interact with emojis, save them to the favorites list, and access other pages of the application. It is a central element of the user experience in EmoJournal.

list_page.dart file contains the definition of the ListPage class, representing the emoji list page in the EmoJournal application. This file contributes to displaying a list of emojis within the application and facilitates user navigation within this section of EmoJournal.

settings_page.dart file contains the definition of the SettingsPage class, representing the settings page of the EmoJournal application. This file contributes to managing the application settings, allowing users to choose between different theme modes. Using Provider, changes in the theme mode are updated in real-time throughout the application.

custom_emoji_button.dart file contains the definition of the CustomEmojiButton class, representing a custom button for displaying and selecting an emoji within the EmoJournal application. This file contributes to creating a reusable button for displaying and selecting emojis in various parts of the application, providing a consistent and easily manageable visual interface.

calendar_app_bar.dart file contains the definition of the CalendarAppBar class, representing the top bar of the Calendar page within the EmoJournal application. This file contributes to creating visual consistency within the application by providing a standardized top bar for the Calendar page, thereby enhancing the user experience.

interactive_calendar.dart file contains the definition of the InteractiveCalendar class, representing a widget for displaying an interactive calendar within the EmoJournal application. This file contributes to implementing date selection functionality through an interactive calendar in the application, providing users with an intuitive way to interact with dates in the context of the Calendar page.

emoticon_of_the_day_description.dart file contains the definition of the EmoticonOfTheDayDescription class, representing a widget for displaying the "Emoji of the Day" description within the EmoJournal application. This widget represents a part of the graphical interface of the "Emoticon of the Day" page and provides a visual description of that section. It is used to give users visual context regarding the information displayed on this page.

emoticon_of_the_day_display.dart file contains the definition of the EmoticonOfTheDayDisplay class, representing a widget for displaying the "Emoji of the Day" within the EmoJournal application. This widget represents a part of the graphical interface of the "Emoticon of the Day" page and provides users with the visual representation of the emoji of the day. The text size is animated to add a pleasant and dynamic visual effect.

widgets_emoticon_page.dart file serves as an export for the widgets associated with the "Emoticon of the Day" page within the EmoJournal application. It is used to reference the two widgets defined in other parts of the application. By exporting these widgets, it allows greater modularity in the application's code. Other parts of the application, such as the main page or other widgets, can import and use these widgets without needing to know the internal details of their implementation. This promotes a clear and easily maintainable code structure.

favorite_list_item.dart file contains the FavoriteListItem widget, used to display a favorite item in the list of favorites within the EmoJournal application. By using this widget, the list of favorite items becomes more interactive and allows users to delete items directly from the list. Integration with EmojiData allows easy access to the necessary data to display the favorite emoji and its corresponding date for each favorite item.

favorite_page_body.dart file contains the FavoritesPageBody widget, used to build the body of the Favorites page within the EmoJournal application. This widget is part of the implementation of the Favorites page and provides an interactive interface for managing the list of favorite items.

widgets_favorites_page.dart file serves as an export for the widgets associated with the "Favorites" page within the EmoJournal application. These exports allow easy use of these widgets in other parts of the application, such as defining the structure of the Favorites page and integrating them into various components of the application.

action_row.dart file contains the ActionsRow widget, representing the action row on the main page of the EmoJournal application. This widget adds interactivity and functionality to the main page, allowing users to add new emojis and view favorite emojis.

bottom_navigation.dart file contains the BottomNavigation widget, representing the bottom navigation bar on the main page of the EmoJournal application. This widget provides a convenient way for users to navigate between the main pages of the EmoJournal application.

selected_emoji_display.dart file contains the SelectedEmojiDisplay widget, which displays the selected emoji at the top of the main page of the EmoJournal application. This widget adds an important visual component to the main page, distinctly showing the selected emoji in an attractive and easily identifiable way.

top_bar.dart file contains the TopBar widget, representing the top bar of the EmoJournal application. It provides quick access to key pages of the application, such as the calendar and settings. This widget offers an intuitive interface and quick access to the key functionalities of the application, facilitating user navigation between pages.

change_notifier_provider.dart file contains the configuration to use ChangeNotifierProvider to manage the application state regarding favorite items. Additionally, MyApp is defined, representing the application itself. This file serves as the starting point of the application and configures the provider to manage the global state of the application. Thus, FavoritesNotifier can be used to track and update the state related to favorite items in various widgets of the application.

emoji_item.dart file contains the definition of the EmojiItem widget, used to display an emoji and its associated name in a list, along with the ability to add or remove the emoji from the favorites list. This EmojiItem widget provides a user-friendly visual interface, allowing them to see the emoji and associated name, add or remove the emoji from the favorites list with a simple tap.

favorites_notifier.dart file contains the FavoritesNotifier class, which is a class that extends ChangeNotifier from the flutter/foundation package. This class provides a way to notify listeners about changes in the state related to favorite emojis. It serves as a central hub for the state and management of favorite emojis in the application, facilitating communication between various components that want to react to changes in the favorites list.

settings_widgets.dart file contains two widgets, LightModeOption and DarkModeOption, which are used to display the options for switching between Light and Dark modes within the settings page. These widgets provide an interactive and easily accessible way for users to change the theme mode within the application, contributing to the personalized user experience.

main.dart file is the main entry point into the application and contains the initial configuration. It provides instances for EmojiData, ThemeProvider, and FavoritesNotifier using ChangeNotifierProvider. Then, the MyApp class is defined, which extends StatelessWidget and initializes and runs the application. This file represents the "body" of the application, managing initial configurations and defining how the application will be presented and interact with users.
