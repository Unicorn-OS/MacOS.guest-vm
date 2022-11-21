import pathlib, os

hyperion = f"{pathlib.Path.home()}/.uni/hyperion"
mac_dir = "macOS-Simple-KVM"
image_dir = f"{hyperion}/{mac_dir}/images"

default_images = ("MyDisk", "ESP")


def listImage():
    return os.listdir(f"{image_dir}/")

def getImgPath(image_name):
    return f"{image_dir}/{image_name}.qcow2"