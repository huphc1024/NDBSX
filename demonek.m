
mycam = char(caminf.InstalledAdaptors());
mycaminfo = imaqhwinfo(mycam);
resolution = char(mycaminfo.DeviceInfo.SupportedFormats());
vid = videoinput(mycam, 1, resolution);