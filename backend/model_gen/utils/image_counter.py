from pathlib import Path


def get_total_games(game_image_dir: Path):
    game_list = [folder for folder in game_image_dir.glob("*")]
    return len(game_list)
