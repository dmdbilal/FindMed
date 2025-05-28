# FindMed

---------------------------------------------------------------
# TODO
[x] Change date to time interval in JSON. Format the date to use in the app.
[x] Create data models
[x] Create Decodable data models
[x] Create mock data

---------------------------------------------------------------

## Data Models for FindMed:
1. Users - Doctor, Hospital
2. Application(Doctor + Post)
3. Post
4. Chats(for now only text messages)

---------------------------------------------------------------

## Basic Feature Flow for MVP:

Hospital Features
1. Log in as a Hospital
2. Create a Profile
3. Create Job Posts
4. View Applications for posts and approve/reject them
5. Chat with Doctors

Doctor Features
1. Log in as a Doctor
2. Create a Profile
3. View Job Posts
4. Apply for posts
5. Chat with Hospitals

Admin Features
1. View pending profiles (Doctors and Hospitals) for verification
2. Approve/Reject profiles

---------------------------------------------------------------

## Development Steps:
[x] 1. Define Data Models and Decodable Objects
[x] 2. Create Mock Data for Testing
3. Complete Views with Hardcoded/Mock Data
4. Segregate and Inject Data into Views
5. Use Persistent Storage Mechanisms (UserDefaults/Keychain)
6. Integrate the Backend (TBD)

---------------------------------------------------------------

## Pending Screens (Only UI):
3. History:
   - My Applications
   - Posted Posts
5. Profile
Filter behaviour - Jobs, History

---------------------------------------------------------------

## Completed Screens (Only UI):
1. Home
2. Jobs:
   - Job Description
   - Filling Applications
   - Date Selector in Filter
   - Create Post
4. Chats:
   - Message

---------------------------------------------------------------

## Current Issues:
- 

---------------------------------------------------------------

## Fixed Issues:
1. Custom popup dialog view
2. TabView appearing in all screens and sub-screens
3. Data mismatch & parsing errors between json and the model

---------------------------------------------------------------

ApplicationForm:
- Used In:
  - Job Description (Apply)
  - Review Application
  - Review Profile
- Fields:
  - Personal
  - Educational
  - Professional
  - Documents

---------------------------------------------------------------

## Future Updates:
- Location Picker (Custom Component)

---------------------------------------------------------------
