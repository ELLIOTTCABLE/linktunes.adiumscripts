on substitute()
  try
    
    tell application "iTunes"
      if player state is playing then
        if class of current track is in {track, file track, URL track, device track, shared track} then
          set theArtist to artist of current track
          set theAlbum to album of current track
          set theSong to name of current track
          if theArtist is missing value then
            set theArtist to ""
          end if
          if theAlbum is missing value then
            set theAlbum to ""
          end if
          set thePath to the POSIX path of ((get location of current track) as string)
        else
          return "something"
        end if
      else if player state is paused or player state is stopped then
        return "nothing"
      end if
    end tell
    
    -- This is a horrible hack, pending a response to http://lists.apple.com/archives/applescript-users/2009/Feb/msg00050.html
    set scriptPath to quoted form of ((POSIX path of (path to me)) & ".rb")
    if (do shell script "if [[ -f " & scriptPath & " ]]; then echo exists; fi") ≠ "" then
      return (do shell script scriptPath&" "&(quoted form of theSong)&" "&(quoted form of theAlbum)&" "&(quoted form of theArtist)&" "&(quoted form of thePath))
    else
      return "Error: " & scriptPath & "does not exist"
    end if
    
  on error errorString
    return "Error: " & errorString
  end try
end substitute
