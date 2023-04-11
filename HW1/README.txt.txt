Detailed description of the ER diagram:

------------------------
|		             |
|           users         |
------------------------

- The users entity is the parent entity and contains attributes related to the metadata of the users.
- attribues: user_id (primary key), email, age, address, creator (boolean)
- A user may or may not be a creator or a subscriber or both.


------------------------
|		             |
|       creators        |
------------------------

- This is child entity.
- It stores the creator id(foreign key from users table) and the channel_id (foreign key from channel table).
- attributes:  creator_id, channel_id
-  creator_id cannot be primary key as one creator can have more than one channels, so there would be more than 1 entry for same creator_id in this table.
- A creator can own many channels (0 to many)
------------------------
|		             |
|      subscribers    |
------------------------

- This is child entity.
- It stores the subscriber id(foreign key from users table), channel_id (foreign key from channel table) of the subscribed channel and the subscription_type attribute which is boolean type and stored whether the subscription is paid or not.
- sub_id cannot be primary key as one subscriber can subscribe to many channels and thus there can be more than one entry for the same sub_entry.

------------------------
|		             |
|       channel         |
------------------------

- This is another parent table.
- It has attributes : channel_id which is the channel name(as no 2 channels can have the same name, owner (foreign key from user table), and other attributes
- 1 creator can have many channels (one to many)
- 1 user can subcribe to many channels (subscribers --> channel one to many))

------------------------
|		             |
|         videos         |
------------------------

- This is another parent table
- attributes: url (primary key), uploader_id (foreign key from user table), title, thumbnail(BLOB), category, duration, description, and upload date and time as a timestamp
- 1 channel can have many videos (channel --> videos is zero to many)

------------------------
|		             |
|    video_stats      |
------------------------

- every video has a statistics report
- video_id is the key (foreign key from videos table)
- attributes: likes, dislikes, view_count, n_shares, n_comments
- this table can be a part of videos table but creating a separate table seems convinient.

------------------------
|		            |
|     comments      |
------------------------
- Every video can have 0 or multiple comments(videos --> comments is 0 to many)
- every user can comment 0 or multiple times (users--> comments is 0 to many)
- video_id is the key(foreign key from videos table)
- attributes: COMMENT_ID, user_id, comment_text, likes, sentiment, comment date and time as datetime
- their can be only one entry for a video
- comment text can be a collectin of comments

------------------------
|		             |
|       sponsors       |
------------------------

- a video can be sponsored (videos -->  sponsor is 0 to many)
- the key is sponsor_id which is a composite key created using sponsor_name and video URL 
attributes: 
- this is done in order to have a unique entry for a sponsor-video pair.

The creators and subscribers tables are derived from the users,videos, and channel tables and can be created at runtime also. They can be treated as views as they may be needed more frequently.
