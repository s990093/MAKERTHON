# from enum import Enum
# from uuid import UUID
# from datetime import datetime
# from typing import Union, Any, List, TypeVar, Type, Callable, cast
# import dateutil.parser


# T = TypeVar("T")
# EnumT = TypeVar("EnumT", bound=Enum)


# def from_datetime(x: Any) -> datetime:
#     return dateutil.parser.parse(x)


# def from_str(x: Any) -> str:
#     assert isinstance(x, str)
#     return x


# def from_float(x: Any) -> float:
#     assert isinstance(x, (float, int)) and not isinstance(x, bool)
#     return float(x)


# def from_union(fs, x):
#     for f in fs:
#         try:
#             return f(x)
#         except:
#             pass
#     assert False


# def to_enum(c: Type[EnumT], x: Any) -> EnumT:
#     assert isinstance(x, c)
#     return x.value


# def to_float(x: Any) -> float:
#     assert isinstance(x, float)
#     return x


# def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
#     assert isinstance(x, list)
#     return [f(y) for y in x]


# def to_class(c: Type[T], x: Any) -> dict:
#     assert isinstance(x, c)
#     return cast(Any, x).to_dict()


# class AdminName(Enum):
#     經濟部水利署水文技術組 = "經濟部水利署水文技術組"


# class CountyName(Enum):
#     臺灣省宜蘭縣 = "臺灣省宜蘭縣"


# class Name(Enum):
#     地下水位 = "地下水位"


# class SIUnit(Enum):
#     M = "m"


# class Measurement:
#     io_w_physical_quantity_id: UUID
#     time_stamp: datetime
#     name: Name
#     full_name: str
#     si_unit: SIUnit
#     value: Union[float, str]

#     def __init__(self, io_w_physical_quantity_id: UUID, time_stamp: datetime, name: Name, full_name: str, si_unit: SIUnit, value: Union[float, str]) -> None:
#         self.io_w_physical_quantity_id = io_w_physical_quantity_id
#         self.time_stamp = time_stamp
#         self.name = name
#         self.full_name = full_name
#         self.si_unit = si_unit
#         self.value = value

#     @staticmethod
#     def from_dict(obj: Any) -> 'Measurement':
#         assert isinstance(obj, dict)
#         io_w_physical_quantity_id = UUID(obj.get("IoWPhysicalQuantityId"))
#         time_stamp = from_datetime(obj.get("TimeStamp"))
#         name = Name(obj.get("Name"))
#         full_name = from_str(obj.get("FullName"))
#         si_unit = SIUnit(obj.get("SIUnit"))
#         value = from_union([from_float, from_str], obj.get("Value"))
#         return Measurement(io_w_physical_quantity_id, time_stamp, name, full_name, si_unit, value)

#     def to_dict(self) -> dict:
#         result: dict = {}
#         result["IoWPhysicalQuantityId"] = str(self.io_w_physical_quantity_id)
#         result["TimeStamp"] = self.time_stamp.isoformat()
#         result["Name"] = to_enum(Name, self.name)
#         result["FullName"] = from_str(self.full_name)
#         result["SIUnit"] = to_enum(SIUnit, self.si_unit)
#         result["Value"] = from_union([to_float, from_str], self.value)
#         return result


# class WelcomeElement:
#     io_w_station_id: UUID
#     station_id: str
#     name: str
#     county_code: int
#     county_name: CountyName
#     town_code: int
#     town_name: str
#     latitude: float
#     longtiude: float
#     admin_name: AdminName
#     measurements: List[Measurement]

#     def __init__(self, io_w_station_id: UUID, station_id: str, name: str, county_code: int, county_name: CountyName, town_code: int, town_name: str, latitude: float, longtiude: float, admin_name: AdminName, measurements: List[Measurement]) -> None:
#         self.io_w_station_id = io_w_station_id
#         self.station_id = station_id
#         self.name = name
#         self.county_code = county_code
#         self.county_name = county_name
#         self.town_code = town_code
#         self.town_name = town_name
#         self.latitude = latitude
#         self.longtiude = longtiude
#         self.admin_name = admin_name
#         self.measurements = measurements

#     @staticmethod
#     def from_dict(obj: Any) -> 'WelcomeElement':
#         assert isinstance(obj, dict)
#         io_w_station_id = UUID(obj.get("IoWStationId"))
#         station_id = from_str(obj.get("StationId"))
#         name = from_str(obj.get("Name"))
#         county_code = int(from_str(obj.get("CountyCode")))
#         county_name = CountyName(obj.get("CountyName"))
#         town_code = int(from_str(obj.get("TownCode")))
#         town_name = from_str(obj.get("TownName"))
#         latitude = from_float(obj.get("Latitude"))
#         longtiude = from_float(obj.get("Longtiude"))
#         admin_name = AdminName(obj.get("AdminName"))
#         measurements = from_list(
#             Measurement.from_dict, obj.get("Measurements"))
#         return WelcomeElement(io_w_station_id, station_id, name, county_code, county_name, town_code, town_name, latitude, longtiude, admin_name, measurements)

#     def to_dict(self) -> dict:
#         result: dict = {}
#         result["IoWStationId"] = str(self.io_w_station_id)
#         result["StationId"] = from_str(self.station_id)
#         result["Name"] = from_str(self.name)
#         result["CountyCode"] = from_str(str(self.county_code))
#         result["CountyName"] = to_enum(CountyName, self.county_name)
#         result["TownCode"] = from_str(str(self.town_code))
#         result["TownName"] = from_str(self.town_name)
#         result["Latitude"] = to_float(self.latitude)
#         result["Longtiude"] = to_float(self.longtiude)
#         result["AdminName"] = to_enum(AdminName, self.admin_name)
#         result["Measurements"] = from_list(
#             lambda x: to_class(Measurement, x), self.measurements)
#         return result


# def welcome_from_dict(s: Any) -> List[WelcomeElement]:
#     return from_list(WelcomeElement.from_dict, s)


# def welcome_to_dict(x: List[WelcomeElement]) -> Any:
#     return from_list(lambda x: to_class(WelcomeElement, x), x)
