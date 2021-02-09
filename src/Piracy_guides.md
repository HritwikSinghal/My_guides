

# Piracy

- [Reddit Megathread](https://www.reddit.com/r/Piracy/wiki/megathread/)
    - [tools](https://www.reddit.com/r/piracy/wiki/megathread/tools)

- [[Guide] How to set up Docker containers to automatically download any TV show or movie](https://www.reddit.com/r/Piracy/comments/cuzmro/guide_how_to_set_up_docker_containers_to/)

- [Widewine L3 Decryptor](https://github.com/tomer8007/widevine-l3-decryptor/tree/ed8a97745c69b8cc0fc7f59cec9474b216b49e16)

- Use colab to extract RAR files on drive

- [find programming courses](https://www.reddit.com/r/Piracy/comments/i5pguj/where_would_i_find_programming_courses/)

- [crawler websites](https://www.reddit.com/r/Piracy/comments/i4zaq4/why_do_i_get_this_feeling_not_many_new_pirates/)
    -   ```
        Web crawlers are bots that search the web and index the sites in their databases.

        There are people who made great crawlers meant for piracy that take torrents from public torrent trackers. You find everything in one place. Some websites are even ad free. A big bonus is also you get torrents from tracker sites that require you to register (not a problem... until you stumble upon a Russian torrent site and you don't know Russian).

        *cough* Knaben database @ knaben.xyz *cough*

        This is probably the biggest free torrent crawler that gets torrents from public trackers. It just works. I downloaded terabytes of music and movies thanks to the wonderful people who made this. I just don't like having to login to websites to have access to more music, especially because some websites have stupid rules when it comes to personalising your profile (looking at you, soundpark).
        ```

- [pirated Android games source](https://www.reddit.com/r/Piracy/comments/hx71y9/trusted_pirated_android_games_source/)




<details><summary>text + video tutorial on how to rip from Amazon</summary>
<p>

- [text + video tutorial on how to rip from Amazon](https://www.reddit.com/r/Piracy/comments/kmodia/improved_text_video_tutorial_on_how_to_rip_from/)
    ```
    [VIDEO](https://streamable.com/dk4hxi)
    ____________________________

    TEXT TUTORIAL:

    This assumes you have already installed the Widevine L3 Decryptor and mp4decryptor.

    Step 1: Find a TV show or movie you want to download and open the inspect element before clicking on it.

    Step 2: Start streaming the video with the inspect element open. Preferably, you should be preservidownloaded both encrypted filesng all network logs (you can find it here, in the settings)(https://imgbox.com/YXx8Eis0)

    Step 3: In the network tab, search for "mpd" (should look something like [this](https://imgbox.com/WszKGkbL)). Right click on one of them, and copy the response [image](https://imgbox.com/e5x49lIw). Paste this into something like notepad++.

    Step 4: Search for "cenc:default_KID=". For EACH(!!) result, copy what is inside the quotation marks and paste it somewhere at the top of your document. I recommend first prettifying the xml/html so it is easier to read.

    Video of me doing steps 3 and 4: https://streamable.com/mrmp2m

    (Remove the dashes in the KID or the decompression will not work.)

    Step 5: Go to the console tab, and find each key that matches a KID you found in the MPD.

    In the video, I found CF1F98F85CB74D9B8A7D5576D126FFDB and 743FB7D3CDE3424B932EE841983F3A20, so I would look for those and then copy the keys from a saved .log file.

    [Video](https://streamable.com/p7m6n9)

    Step 6: Now that you have a key and KID (in my case I had 2 pairs) find your video and audio by searching for it. I want to find the highest quality for each, so I will increment until I dont get a response.

    [Video](https://streamable.com/ri0kzb) (only shows audio download [with incrementing], video is the same process but just search for the video instead of audio)

    Step 6: Now that you have downloaded both encrypted files, in powershell or command prompt type

     (path to mp4decrypt.exe) --key (KID):(KEY) "sourcefile.mp4" "destinationfile.mp4"

     Consider adding mp4decrypt to PATH. Repeat this process with different KIDs and keys (dont mix and match the keys!) if the conversion did not successfully decrypt the file. (You might be able to use the same KID and key for both files)

    Step 7: Combine them in mkvToolnix.

    __________

    Answers to common questions

    Thanks!

    ```
</p>
</details>

- ![youtube-dl](/media/PG_1.png)
    - [This](https://github.com/ytdl-org/youtube-dl/blob/master/youtube_dl/extractor/common.py)




## Apps

- [tool to help you archive Microsoft and Xbox store packages](https://github.com/StoreDev/StoreWeb)


--- XXX ---
