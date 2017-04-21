class AddTheYouTubezToTrackz < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :youtube, :string, null: false, default: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
  end
end
