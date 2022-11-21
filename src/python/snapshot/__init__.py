import subprocess
import home

initial_snap = "0."

def infoJson(image):
    output = subprocess.call(['qemu-img', 'info', '--output=json', home.getImgPath(image)])

def snapshotExist(snap, image):
    snap_list = subprocess.call(['qemu-img', 'snapshot', '-l', home.getImgPath(image)])
        

def qemuSnapshot(snap, image):
    subprocess.call(['qemu-img', 'snapshot', '-c', snap, home.getImgPath(image)])


def create(snap = initial_snap, image=home.default_images):
    for i in image:
        qemuSnapshot(snap, i)

def initial():
    pass