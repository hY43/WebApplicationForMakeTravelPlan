package VO;

public class CityVO {
	/* Member Variable */
	private String cityName; // 도시 명
	private int latitude; // 도시의 위도
	private int longitude; // 도시의 경도
	private String info; // 도시 정보
	private String img; // 도시 사진의 경로
	
	/* Constructor */
	public CityVO(){super();}
	public CityVO(String cityName, int latitude, int longitude, String info, String img) {
		super();
		this.cityName = cityName;
		this.latitude = latitude;
		this.longitude = longitude;
		this.info = info;
		this.img = img;
	}

	/* Get/Set Method */
	public String getCityName(){return cityName;}
	public void setCityName(String cityname){this.cityName = cityName;}
	public int getLatitude(){return latitude;}
	public void setLatitude(int latitude){this.latitude = latitude;}
	public int getLongitude(){return longitude;}
	public void setLongitude(int longitude){this.longitude = longitude;}
	public String getInfo(){return info;}
	public void setInfo(String info){this.info = info;}
	public String getImg(){return img;}
	public void setImg(String img){this.img = img;}
}
