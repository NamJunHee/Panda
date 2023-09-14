// Generated by gencpp from file symbolic_msgs/ColorDepthImage.msg
// DO NOT EDIT!


#ifndef SYMBOLIC_MSGS_MESSAGE_COLORDEPTHIMAGE_H
#define SYMBOLIC_MSGS_MESSAGE_COLORDEPTHIMAGE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace symbolic_msgs
{
template <class ContainerAllocator>
struct ColorDepthImage_
{
  typedef ColorDepthImage_<ContainerAllocator> Type;

  ColorDepthImage_()
    : json()  {
    }
  ColorDepthImage_(const ContainerAllocator& _alloc)
    : json(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>> _json_type;
  _json_type json;





  typedef boost::shared_ptr< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> const> ConstPtr;

}; // struct ColorDepthImage_

typedef ::symbolic_msgs::ColorDepthImage_<std::allocator<void> > ColorDepthImage;

typedef boost::shared_ptr< ::symbolic_msgs::ColorDepthImage > ColorDepthImagePtr;
typedef boost::shared_ptr< ::symbolic_msgs::ColorDepthImage const> ColorDepthImageConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::symbolic_msgs::ColorDepthImage_<ContainerAllocator1> & lhs, const ::symbolic_msgs::ColorDepthImage_<ContainerAllocator2> & rhs)
{
  return lhs.json == rhs.json;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::symbolic_msgs::ColorDepthImage_<ContainerAllocator1> & lhs, const ::symbolic_msgs::ColorDepthImage_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace symbolic_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2518043d6087e4ba95ef63957da66e6b";
  }

  static const char* value(const ::symbolic_msgs::ColorDepthImage_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2518043d6087e4baULL;
  static const uint64_t static_value2 = 0x95ef63957da66e6bULL;
};

template<class ContainerAllocator>
struct DataType< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "symbolic_msgs/ColorDepthImage";
  }

  static const char* value(const ::symbolic_msgs::ColorDepthImage_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string[] json\n"
;
  }

  static const char* value(const ::symbolic_msgs::ColorDepthImage_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.json);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ColorDepthImage_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::symbolic_msgs::ColorDepthImage_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::symbolic_msgs::ColorDepthImage_<ContainerAllocator>& v)
  {
    s << indent << "json[]" << std::endl;
    for (size_t i = 0; i < v.json.size(); ++i)
    {
      s << indent << "  json[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.json[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SYMBOLIC_MSGS_MESSAGE_COLORDEPTHIMAGE_H
